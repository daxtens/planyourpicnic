from fabric.api import *

def setup():
	local("pip install bottle")
	local("pip install psycopg2")
	local("pip install simplekml")
	
        # syntax checkers and cleaners
        local("pip install pep8")
        local("easy_install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz")
