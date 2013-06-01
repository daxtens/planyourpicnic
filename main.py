import bottle
import os

@bottle.route('/')
@bottle.route('/index.html')
@bottle.view('index')
def index():
    return {'name': 'GovHack Project'}

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

if __name__=="__main__":
    bottle.run(reloader=True, debug=True, host="0.0.0.0")

