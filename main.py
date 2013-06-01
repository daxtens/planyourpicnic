import bottle

@bottle.route('/')
@bottle.route('/index.html')
@bottle.view('index')
def index():
    return {'name': 'GovHack Project'}

if __name__=="__main__":
    bottle.run(reloader=True, debug=True, host="0.0.0.0")

