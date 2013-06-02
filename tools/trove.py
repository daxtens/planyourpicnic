from lxml import etree
import urllib
import random

troveAPIKey = "a8dh86ihafs8rrdm"
troveBase = "http://api.trove.nla.gov.au/result?"
maxInteresting = 20

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
    resTree = etree.parse(troveBase + keyStr)
    work = resTree.getroot()[1][0][0]
    page = ""
    thumb = ""
    title = work.find("title").text
    for ident in work.iter("identifier"):
        if ident.get("type") == "url" and ident.get("linktype") == "fulltext":
            page = ident.text
        elif ident.get("type") == "url" and ident.get("linktype") == "thumbnail":
            thumb = ident.text
    if thumb == "" or page == "" or title is None: 
        return findPicture(suburb)
    return [title, thumb, page, work]
    
    
    
res = findPicture('acton')
print "title:     " + res[0]
print "thumbnail: " + res[1]
print "page:      " + res[2]
