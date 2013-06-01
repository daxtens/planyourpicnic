# Download data from relational.io, and load into local PostgreSQL database
# Doesn't work; relationalio doesn't return useful data; don't use

import psycopg2
import psycopg2.extras
import getpass
import sys
sys.path.append('..')
from settings import *

# TODO should these be stored or requested each time?
rio_user = raw_input("RelationalIO Username: ")
rio_pw = getpass.getpass("RelationalIO Password: ")
rio_conn = psycopg2.connect(host="workspace.govhack.relational.io",
                            database=rio_user, user=rio_user, password=rio_pw,
                            port=5432, sslmode="require")
rio_cur = rio_conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

local_conn = psycopg2.connect(host=DB_HOST, database=DB_DATABASE,
                              user=DB_USER, password=DB_PASSWORD, port=DB_PORT)
local_cur = local_conn.cursor()

rio_cur.execute("SELECT (asset_id,surface_type,location) FROM act_gov_au$playgroundsintheact.playgroundsintheact")
row = rio_cur.fetchone()
print row
print row.keys()
print row['asset_id']
#for result in rio_cur:
#    print result['asset_id']

# TODO remove
#rio_cur.execute("SELECT * FROM act_gov_au$playgroundsintheact.playgroundsintheact")
#results = rio_cur.fetchall()
#for row in results:
#    print row


local_cur.close()
local_conn.close()

rio_cur.close()
rio_conn.close()
