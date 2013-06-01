#!/usr/bin/env python


# Generate KML containing all POIs

from settings import *

import psycopg2
from db import DB

import simplekml


# Connect to database
d = DB()
cur = d.cursor()


# Styles
bbq_style = simplekml.Style()
bbq_style.labelstyle.color = 'ff0000ff'  # Red
bbq_style.iconstyle.icon.href= 'http://www.google.com/mapfiles/ms/micons/firedept.png'

furniture_style = simplekml.Style()
furniture_style.iconstyle.icon.href="http://maps.google.com/mapfiles/kml/pal2/icon20.png"

toilet_style = simplekml.Style()
toilet_style.labelstyle.color = 'ff0000ff'  # Red
toilet_style.iconstyle.icon.href= 'http://www.google.com/mapfiles/ms/micons/toilets.png'

playground_style = simplekml.Style()
playground_style.iconstyle.icon.href="http://labs.google.com/ridefinder/images/mm_20_yellow.png"



# BBQs
kml = simplekml.Kml()

cur.execute("SELECT pois.location, bbqs.name, bbqs.suburb, bbqs.type, bbqs.hotplates FROM pois, bbqs WHERE pois.type='bbq' AND pois.id=bbqs.id;")
bbqs = cur.fetchall()

for bbq in bbqs:
    if bbq['location'] != None:
        coords = bbq['location'][1:-1].split(',')
        point = kml.newpoint(name="BBQ - " + bbq['name'] + ' - ' + bbq['suburb'], coords=[(float(coords[1]), float(coords[0]))])
        point.style = bbq_style

kml.save("data/bbq.kml")



# Playgrounds
kml = simplekml.Kml()

cur.execute("SELECT pois.location, playgrounds.division_name, playgrounds.area FROM pois, playgrounds WHERE pois.type='playground' AND pois.id=playgrounds.id;")
playgrounds = cur.fetchall()

for playground in playgrounds:
    if playground['location'] != None:
        coords = playground['location'][1:-1].split(',')
        rating = (0 <= playground['area'] < 500 and "Small" or
            500 <= playground['area'] < 1000 and "Medium" or
            "Large")
        point = kml.newpoint(name="Playground - %s - %s" % (playground['division_name'], rating), coords=[(float(coords[1]), float(coords[0]))])
        point.style = playground_style

kml.save("data/playgrounds.kml")


# Toilets
kml = simplekml.Kml()

cur.execute("SELECT pois.location, toilets.division_name, toilets.location_description, toilets.toilet_type_text FROM pois, toilets WHERE pois.type='toilet' AND pois.id=toilets.id;")
toilets = cur.fetchall()

for toilet in toilets:
    if toilet['location'] != None:
        coords = toilet['location'][1:-1].split(',')
        point = kml.newpoint(name="Toilet - " + toilet['division_name'] + ' - ' + toilet['location_description'] + ' - ' + toilet['toilet_type_text'], coords=[(float(coords[1]), float(coords[0]))])
        point.style = toilet_style

kml.save("data/toilets.kml")


# Furnitures - which is totally a word now
kml = simplekml.Kml()

cur.execute("SELECT pois.location, furniture.division_name, furniture.feature_type, furniture.location_name FROM pois, furniture WHERE pois.type='furniture' AND pois.id=furniture.id;")
furnitures = cur.fetchall()

for furniture in furnitures:
    if furniture['location'] != None:
        coords = furniture['location'][1:-1].split(',')
        point = kml.newpoint(name=furniture['feature_type'] + " - " + furniture['division_name'] + ' - ' + furniture['location_name'], coords=[(float(coords[1]), float(coords[0]))])
        point.style = furniture_style

kml.save("data/furnitures.kml")
