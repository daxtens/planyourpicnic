import simplekml
import csv
import re

coordRe = re.compile(r"^\((.*),(.*)\)$")
def initPlayStyle():
    style = simplekml.Style()
    style.iconstyle.icon.href = "http://google.com/mapfiles/kml/pal2/icon57.png"
    return style
    
def initFurnitureStyle():
    style = simplekml.Style()
    style.iconstyle.icon.href = "http://google.com/mapfiles/ms/micons/picnic.png"
    return style
    
playStyle = initPlayStyle()
furnitureStyle = initFurnitureStyle()

def getCoord(string):
    match = coordRe.match(string)
    if match is None:
        raise "error: could not parse as coord: " + string
    else:
        return (float(match.group(2)), float(match.group(1)))

kml = simplekml.Kml()
with open('data/Public_Furniture_in_the_ACT.csv') as csvfile:
    reader = csv.reader(csvfile)
    header = reader.next()
    for row in reader:
        point = kml.newpoint(name=row[0], description=row[3] + ": " + row[1], 
            coords=[getCoord(row[4])])
        point.style = furnitureStyle
    kml.save("data/publicfurniture.kml")
    
kml = simplekml.Kml()
with open('data/Playgrounds_in_the_ACT.csv') as csvfile:
    reader = csv.reader(csvfile)
    header = reader.next()
    for row in reader:
        point = kml.newpoint(name=row[0], coords=[getCoord(row[5])])
        point.style = playStyle
    kml.save("data/playgrounds.kml")
    
    
