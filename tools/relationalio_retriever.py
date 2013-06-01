# Download data from relational.io, and load into local PostgreSQL database

import psycopg2
import getpass
import ../settings.py

#TODO should these be stored or requested each time?
rio_user = raw_input("RelationalIO Username: ")
rio_pw = getpass.getpass("RelationalIO Password: ")
rio_conn = psycopg2.connect(host="workspace.govhack.relational.io", database=rio_user, user=rio_user, password=rio_pw, port=5432, sslmode="require")
rio_cur = rio_conn.cursor()

local_user = "" #TODO get local server details
local_pw = "" #TODO (can this be stored safely?
local_conn = psycopg2.connect(host=DB_HOST, database=DB_DATABASE, user=DB_USER, password=DB_PASSWORD, port=DB_PORT)
local_cur = local_conn.cursor()

#TODO remove
#rio_cur.execute("SELECT * FROM act_gov_au$playgroundsintheact.playgroundsintheact")
#results = rio_cur.fetchall()
#for row in results:
#    print row


local_cur.close()
local_conn.close()

rio_cur.close()
rio_conn.close()
