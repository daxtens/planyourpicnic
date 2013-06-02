#!/usr/bin/env python

# Convert ACT BBQ listing into a useful format
# Takes ACT BBQ listing as a CSV (original is XLS, convert using LibreOffice)

if __name__ == '__main__':
    import pyproj
    from pyproj import Proj
    import csv
    import sys

    if len(sys.argv) < 3:
        print "usage: bbq_converter.py [input file] [output file]"
        sys.exit(1)


    # Proj object to convert Stromlo Projection coordinates to latitude/longitude
    #p = Proj(projparams="+proj=tmerc +lat_0=0 +lon_0=149.00929483 +k=1.000086 +x_0=200000 +y_0=4510193.494 +ellps=aust_SA +units=m +no_defs")
    p = Proj(projparams="+proj=tmerc +lat_0=0 +lon_0=149.00929483 +k=1.000086 +x_0=200000 +y_0=4510193.494 +ellps=aust_SA +units=m +no_defs")
    bbqs = []

    with open(sys.argv[1]) as csvfile:
        reader = csv.reader(csvfile)
        reader.next()
        for line in reader:
            if line[6] and line[7]:
                x = int(line[6].replace(',',''))
                y = int(line[7].replace(',',''))
                p2 = Proj(proj='latlong', datum='WGS84')
                #lon, lat = pyproj.transform(p, p2, x, y)
                
                p3 = Proj(projparams="+proj=latlong +a=6378160 +rf=298.250000000055 +towgs84=-133.0,-48.0,148.0  +to +proj=latlong +ellps=GRS80 +towgs84=0,0,0")
                
                lon, lat = pyproj.transform(p, p3, x, y)
                lon, lat = pyproj.transform(p3, p2, lon, lat)
                #lon, lat = p(int(line[6].replace(',','')), int(line[7].replace(',','')), inverse=True)
            else:
                lon = ''
                lat = ''
            
            bbqs.append((
                line[13], # location name
                line[12], # suburb ("contract unit")
                lat,
                lon,
                line[8], # Hotplate type
                line[9], # Single/double hotplate
                line[14], # Tap at BBQ
                line[15], # Bench type
                line[16], # Wired door
                line[17], # climb access
                line[18] #hotplate material
            ))


    with open(sys.argv[2],'w') as csvoutput:
        writer = csv.writer(csvoutput)
        writer.writerows(bbqs)
        

