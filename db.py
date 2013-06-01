# Very very trivial database connection wrapper

import psycopg2
import psycopg2.extras
from settings import *



class DB(object):
    _connected = False
    _conn = None
    _cur = None
    
    def cursor(self):
        if self._connected:
            return self._cur
        self._connected = True
        try:
            self._conn = psycopg2.connect(host=DB_HOST, port=DB_PORT, database=DB_DATABASE, user=DB_USER, password=DB_PASSWORD)
            self._cur = self._conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            return self._cur
        except psycopg2.Error, e:
            print "DB Error:", e.pgerror
            raise e
    
    def disconnect(self):
        self._conn.close()
        self._connected = False