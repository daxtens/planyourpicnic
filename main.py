#!/usr/bin/python

import bottle
import os, sys
import settings

@bottle.route('/')
@bottle.route('/index.html')
@bottle.view('index')
def index():
    return {'hostname': settings.HOSTNAME}


@bottle.route('/about')
@bottle.view('about')
def about():
    return {}


@bottle.route('/contact')
@bottle.view('contact')
def contact():
    return {}


@bottle.route('/<path:path>')
def static(path):
    print(os.path.dirname(__file__))
    return bottle.static_file(path, root=os.path.dirname(__file__))

if __name__ == "__main__":
    # get things in order for when we're lanuched from supervisor
    if os.path.dirname(__file__):
        os.chdir(os.path.dirname(__file__))
        sys.path.append(os.path.dirname(__file__))

    # run it
    bottle.run(reloader=True, debug=True, host="0.0.0.0")
