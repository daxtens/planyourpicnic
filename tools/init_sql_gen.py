#!/usr/bin/env python

# Create the SQL initialisation script
# Takes BBQ data CSV as argument

import sys
import csv

current_id = 0

# Import the data
with open(sys.argv[1]) as csvfile:
    reader = csv.reader(csvfile)
    for line in reader:
        
        print "INSERT INTO pois (id, location, type) VALUES (%d, %s, 'bbq');" % (current_id, (line[2] and line[3]) and "'%s, %s'" % (line[2], line[3]) or 'NULL')
        
        
        print "INSERT INTO bbqs (id, name, suburb, location, type, hotplates, tap, bench_type, wired_door, climb_access, hotplate_material) VALUES (%d, '%s', '%s', %s, '%s', %d, %s, %s, %s, %s, %s);" % \
            (current_id,
            line[0],
            line[1],
            (line[2] and line[3]) and "'%s, %s'" % (line[2], line[3]) or 'NULL',
            line[4],
            line[5]=='SINGLE' and 1 or 2,
            line[6] == 'Y' and 'TRUE' or (line[6] == 'N' and 'FALSE' or 'NULL'),
            line[7] and "'" + line[7] + "'" or 'NULL',
            line[8] == 'YES' and 'TRUE' or (line[8] == 'NO' and 'FALSE' or 'NULL'),
            line[9] and "'" + line[9] + "'" or 'NULL',
            line[10] and (line[10] == 'CAST IRON' and "'CAST_IRON'" or "'" + line[10] + "'") or 'NULL')
        
        current_id += 1