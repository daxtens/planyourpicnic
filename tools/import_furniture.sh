sudo -u postgres psql planyourpicnic -f import_furniture_sqlinit.sql
python import_furniture.py
