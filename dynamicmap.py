# Generate groups of pois
import sys
from settings import *
import psycopg2
import psycopg2.extensions
import re
import bottle
import simplekml
import urllib

class Point(object):
    def __init__(self, dataString):
        #clip out parenthesis, and split over comma
        data = dataString[1:-1].split(', ')
        self.longitude = float(data[1])
        #input is in standard order (lat,long)
        self.latitude = float(data[0])
    def __init__(self, longitude, latitude):
        self.longitude = longitude
        self.latitude = latitude
    def __repr__(self):
        return "(" + repr(self.latitude) + ", " + repr(self.longitude) + ")"

def adapt_point(point):
    #store in sql order (long,lat)
    return psycopg2.extensions.AsIs("'(%s, %s)'" % (psycopg2.extensions.adapt(point.longitude), psycopg2.extensions.adapt(point.latitude)))

#From psycopg docs
def cast_point(value, cur):
    if value is None:
        return None

    # Convert from (f1, f2) syntax using a regular expression.
    m = re.match(r"\(([^)]+),([^)]+)\)", value)
    if m:
        return Point(float(m.group(1)), float(m.group(2)))
    else:
        raise InterfaceError("bad point representation: %r" % value)

psycopg2.extensions.register_adapter(Point, adapt_point)


@bottle.route('/dynamicmap.kml/:hasbbq/:hasplayground/:hastoilet/:hastable')
def dynamickml(hasbbq, hasplayground, hastoilet, hastable):

    targets = [int(hasbbq), int(hasplayground), int(hastoilet), int(hastable)]
    names = ['bbqs', 'playgrounds', 'toilets', 'furniture']
    ases = ['first', 'second', 'third', 'fourth']

    if len([x for x in targets if x]) < 2:
        return None

    query = '(select first.id from '

    threshold = 0.3

    fragment_num = 0

    for idx, val in enumerate(targets):
        if not val:
            continue

        if fragment_num == 0:
            query = query + names[idx] + ' as ' + ases[fragment_num]
        else:
            query = query + ' join ' + names[idx] + ' as ' + ases[fragment_num] + \
                    ' on (first.location <@> ' + ases[fragment_num] + '.location) < ' + \
                    str(threshold) + ' '

        if idx == 3:
            furn_frag = ases[fragment_num]

        fragment_num = fragment_num + 1

    if hastable == '1':
        query = query + ' where ' + furn_frag + ".feature_type = 'TABLE'"
        
    query = query + ') as subq '

    if hasbbq == '1':
        query = "SELECT (dest.name || ' (' || dest.suburb || ')') as name, dest.location as location from " + query + ' join bbqs'
    elif hasplayground == '1':
        query = 'SELECT dest.division_name as name, dest.location as location from ' + query + ' join playgrounds'
    elif hastoilet == '1':
        query = "SELECT (dest.location_description, || ' (' || dest.division_name || ')') as name, dest.location as location from " + query + ' join toilets'


    query = query + ' as dest on dest.id = subq.id;'
    print query
    db_conn = psycopg2.connect(host=DB_HOST, database=DB_DATABASE,
                              user=DB_USER, password=DB_PASSWORD, port=DB_PORT)
    db_cur = db_conn.cursor()

    #set up casting for python type point
    db_cur.execute("SELECT NULL::point")
    point_oid = db_cur.description[0][1]
    POINT = psycopg2.extensions.new_type((point_oid,), "POINT", cast_point)
    psycopg2.extensions.register_type(POINT)

    db_cur.execute(query)


    style = simplekml.Style()
    style.labelstyle.color = 'ff0000ff'  # Red
    style.iconstyle.icon.href= 'http://www.google.com/intl/en_us/mapfiles/ms/icons/red-dot.png'
    kml = simplekml.Kml()

    
    past = []
    for entry in db_cur:
        print entry
        if not entry[1] is None and not entry[0] == past:
            #print entry[0], entry[1]
            past = entry[0]
            point = kml.newpoint(name=entry[0], coords=[(entry[1].longitude, entry[1].latitude)],
                                 description='<a href="http://maps.google.com/maps?q=' + \
                                 str(entry[1].latitude) + '+' + str(entry[1].longitude) + \
                                 '&hl=en&t=m&z=16&iwloc=A&f=d">Directions to here</a>')
            point.style = style

    db_cur.close()
    db_conn.close()

    bottle.response.content_type = "application/vnd.google-earth.kml+xml"
    return kml.kml()
