#!/usr/bin/env python


# Generate KML containing all POIs

from settings import *

import psycopg2
from db import DB

import simplekml


# Connect to database
d = DB()
cur = d.cursor()


# Initialise KML
kml = simplekml.Kml()

## v0.1 - generate a kml with just locations, from the pois table




# BBQs
bbq_style = simplekml.Style()
bbq_style.labelstyle.color = 'ff0000ff'  # Red
bbq_style.iconstyle.icon.href= 'http://www.google.com/mapfiles/ms/micons/firedept.png'

cur.execute("SELECT pois.location, bbqs.name, bbqs.suburb, bbqs.type, bbqs.hotplates FROM pois, bbqs WHERE pois.type='bbq' AND pois.id=bbqs.id;")
bbqs = cur.fetchall()

for bbq in bbqs:
    if bbq['location'] != None:
        coords = bbq['location'][1:-1].split(',')
        point = kml.newpoint(name="BBQ - " + bbq['name'] + ' - ' + bbq['suburb'], coords=[(float(coords[1]), float(coords[0]))])
        point.style = bbq_style

print kml.kml()

