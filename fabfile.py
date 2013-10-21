from fabric.api import *

def setup():
	local("pip install bottle")
	local("pip install psycopg2")
	local("pip install simplekml pykml lxml")
	local("pip install pyproj")
        
        # syntax checkers and cleaners
        local("pip install pep8")
        local("easy_install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz")
        
        # Set up database
        local("sudo -u postgres psql -f data/create_user_db.sql")
        local("cd tools; ./import_all.sh")


def init_ec2():
    run("sudo apt-get update; sudo apt-get upgrade -y")
    run("sudo apt-get install -y python-dev postgresql libpq-dev git fabric nginx supervisor python-pip postgresql-contrib libxml2-dev libxslt1-dev")
    run("[ -e /home/pyp ] || sudo useradd -m pyp")
    run("sudo rm -rf /home/pyp/planyourpicnic")
    run("sudo -u pyp git clone git://github.com/daxtens/planyourpicnic.git /home/pyp/planyourpicnic")
    run("cd /home/pyp/planyourpicnic; sudo fab setup")
    run("cd /home/pyp/planyourpicnic/tools; sudo bash ./import_all.sh")
    run("""cat > /tmp/pyp.conf << __EOF__
[program:pyp]
user=pyp
command=/home/pyp/planyourpicnic/main.py
autostart=true
autorestart=true
__EOF__""")
    run("sudo mv /tmp/pyp.conf /etc/supervisor/conf.d/")
    run("sudo supervisorctl start pyp")
    run("""cat > /tmp/default << __EOF__
upstream pyp {
        server 127.0.0.1:8080;
}

server {
        root /home/pyp/planyourpicnic;
        index index.html index.htm;

        server_name planyourpicnic.dja.id.au planyourpicnic.org.au;

        location / {
                proxy_pass  http://pyp;
                proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
                proxy_redirect off;
                proxy_buffering off;
                proxy_set_header        Host            \\\$host;
                proxy_set_header        X-Real-IP       \\\$remote_addr;
                proxy_set_header        X-Forwarded-For \\\$proxy_add_x_forwarded_for;
                access_log /var/log/nginx/access.log;
        }
}
__EOF__""")
    run("sudo mv /tmp/default /etc/nginx/sites-available")
    run("sudo service nginx restart")

def update_ec2():
    run("sudo rm -rf /home/pyp/planyourpicnic")
    run("sudo -u pyp git clone git://github.com/daxtens/planyourpicnic.git /home/pyp/planyourpicnic")
