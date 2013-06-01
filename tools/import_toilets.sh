sudo -u postgres psql planyourpicnic -f import_toilets_sqlinit.sql
python import_toilets.py
