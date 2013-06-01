import simplekml
import csv
import re

coordRe = re.compile(r"^\((.*),(.*)\)$")

def getCoord(string):
    match = coordRe.match(string)
    if match is None:
        raise "error: could not parse as coord: " + string
    else:
        return (float(match.group(1)), float(match.group(2)))

kml = simplekml.Kml()
with open('../data/Public_Furniture_in_the_ACT.csv') as csvfile:
    reader = csv.reader(csvfile)
    header = reader.next()
    for row in reader:
        kml.newpoint(name=row[0], description=row[3] + ": " + row[1], coords=[getCoord(row[4])])
    kml.save("../data/publicfurniture.kml")
    
kml = simplekml.Kml()
with open('../data/Playgrounds_in_the_ACT.csv') as csvfile:
    reader = csv.reader(csvfile)
    header = reader.next()
    for row in reader:
        kml.newpoint(name=row[0], coords=[getCoord(row[5])])
    kml.save("../data/playgrounds.kml")
    
    
