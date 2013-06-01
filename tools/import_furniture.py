# Import Public Furniture listing into local database from CSV
import sys
sys.path.append('..')
from settings import *
import psycopg2
import psycopg2.extensions
import csv

class Point(object):
    def __init__(self, dataString):
        #clip out parenthesis, and split over comma
        data = dataString[1:-1].split(', ')
        self.x = float(data[0])
        self.y = float(data[1])

def adapt_point(point):
    return psycopg2.extensions.AsIs("'(%s, %s)'" % (psycopg2.extensions.adapt(point.x), psycopg2.extensions.adapt(point.y)))

psycopg2.extensions.register_adapter(Point, adapt_point)

db_conn = psycopg2.connect(host=DB_HOST, database=DB_DATABASE,
                              user=DB_USER, password=DB_PASSWORD, port=DB_PORT)
db_cur = db_conn.cursor()

with open("../data/Public_Furniture_in_the_ACT.csv") as csvfile:
    reader = csv.reader(csvfile)
    reader.next()
    for entry in reader:
        db_cur.execute("INSERT INTO pois (location, type) VALUES (%s, %s)",
                       (Point(entry[4]), 'furniture'))
        #db_cur.execute("INSERT INTO furniture (asset_id, feature_type, division_name, location_name, location) VALUES (%s, %s, %s, %s, %s)",
                       #(entry[0], entry[1], entry[2], entry[3], Point(entry[4])))

db_conn.commit()
db_cur.close()
db_conn.close()
