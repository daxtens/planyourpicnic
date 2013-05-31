from fabric.api import *

def setup():
	local("pip install bottle")
