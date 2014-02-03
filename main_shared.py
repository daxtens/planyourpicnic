#!/usr/bin/python

import os
import sys

# get to the right place
if os.path.dirname(__file__):
        os.chdir(os.path.dirname(__file__))
        sys.path.append(os.path.dirname(__file__))

# virtualenv ourselves
execfile("env/bin/activate_this.py",
        dict(__file__="env/bin/activate_this.py"))

# import stuff
import main
import bottle

# run
bottle.run(reloader=False, debug=False, host="0.0.0.0")
