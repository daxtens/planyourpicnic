from lxml import etree
from lxml import objectify
import urllib
import random

troveAPIKey = "a8dh86ihafs8rrdm"
troveBase = "http://api.trove.nla.gov.au/result?"
maxInteresting = 10

def findPicture(suburb):
    keys = {'key' : troveAPIKey}
    keys['zone'] = 'picture'
    #key words
    keys['q'] = 'ACT ' + suburb
    keys['l-availability'] = 'y/f'
    keys['l-australian'] = 'y'
    keys['include'] = 'links'
    keys['s'] = random.randrange(maxInteresting)
    keys['n'] = 1
    keyStr = urllib.urlencode(keys)
    print (troveBase + keyStr)
    resTree = etree.parse(troveBase + keyStr)
    root = resTree.getroot()
    for ident in root.iter("identifier"):
        if ident.get("type") == "url" and ident.get("linktype") == "fulltext":
            print "fulltext:  " + ident.text
        elif ident.get("type") == "url" and ident.get("linktype") == "thumbnail":
            print "thumbnail: " + ident.text
    return root
    
    
    
findPicture('downer')
