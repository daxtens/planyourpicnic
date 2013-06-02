# Generate groups of pois
# probably not going to use this (will generate on client request
import sys
sys.path.append('..')
from settings import *
import psycopg2
import psycopg2.extensions
import re

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

db_conn = psycopg2.connect(host=DB_HOST, database=DB_DATABASE,
                              user=DB_USER, password=DB_PASSWORD, port=DB_PORT)
db_cur = db_conn.cursor()

#set up casting for python type point
db_cur.execute("SELECT NULL::point")
point_oid = db_cur.description[0][1]
POINT = psycopg2.extensions.new_type((point_oid,), "POINT", cast_point)
psycopg2.extensions.register_type(POINT)

#TODO find proper sql statement to generate sites
db_cur.execute("SELECT b.id, b.location FROM (SELECT * FROM bbqs AS b JOIN playgrounds AS p on (b.location <@> p.location) < 1.0)")
#db_cur.execute("select dest.id, dest.name, dest.location from (select b.id from bbqs as b join playgrounds as p on (b.location <-> p.location) < 0.002 join toilets as t on (b.location <-> t.location) < 0.002 group by b.id) as subq join bbqs as dest on dest.id = subq.id;")
for entry in db_cur:
    if entry[1] != None:
        print entry[0], entry[1]

db_conn.commit()
db_cur.close()
db_conn.close()

###
#@bottle.route('/dynamicmap.kml/:hasbbq/:hasplayground/:hastoilet/:hastable')
#def dynamickml(hasbbq, hasplayground, hastoilet, hastable):
#    if not (hasbbq or hasplayground or hastoilet or hastable):
#        return None
#
#    if hasbbq:
#        root = 'SELECT dest.id, dest.name, dest.location from
