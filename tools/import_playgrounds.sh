sudo -u postgres psql planyourpicnic -f import_playgrounds_sqlinit.sql
python import_playgrounds.py
