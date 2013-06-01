# Download data from relational.io, and load into local PostgreSQL database

import psycopg2
import getpass

# get credentials
rio_user = raw_input("RelationalIO Username: ")
rio_pw = getpass.getpass("RelationalIO Password: ")

rio_conn = psycopg2.connect(host="workspace.govhack.relational.io", database=rio_user, user=rio_user, password=rio_pw, port=5432, sslmode="require")
rio_cur = rio_conn.cursor()

rio_cur.execute("SELECT * FROM act_gov_au$playgroundsintheact.playgroundsintheact")
results = rio_cur.fetchall()

for row in results:
    print row

rio_cur.close()
rio_conn.close()
