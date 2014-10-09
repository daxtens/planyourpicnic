import os
import urlparse

# Plan Your Picnic settings

HOSTNAME = 'planyourpicnic.herokuapp.com'
PORT     = int(os.environ.get('PORT', 8080))

# Database details
dburl = os.environ.get('DATABASE_URL', None)
if dburl is not None:
    result = urlparse.urlparse(dburl)
    DB_USER     = result.username
    DB_PASSWORD = result.password
    DB_DATABASE = result.path[1:]
    DB_HOST     = result.hostname
    DB_PORT     = result.port
else:
    DB_HOST         = 'localhost'
    DB_PORT         = 5432
    DB_DATABASE     = 'planyourpicnic'
    DB_USER         = 'planyourpicnic'
    DB_PASSWORD     = 'planyourpicnic'


# Trove settings
TROVE_API_KEY = "a8dh86ihafs8rrdm"
TROVE_BASE = "http://api.trove.nla.gov.au/result?"
