from lxml import etree
import urllib
import random

troveAPIKey = "a8dh86ihafs8rrdm"
troveBase = "http://api.trove.nla.gov.au/result?"
maxInteresting = 20

def findPicture(suburb, checked=set()):
    keys = {'key' : troveAPIKey}
    keys['zone'] = 'picture'
    #key words
    keys['q'] = 'ACT ' + suburb
    keys['l-availability'] = 'y/f'
    keys['l-australian'] = 'y'
    keys['include'] = 'links'
    if len(checked) < maxInteresting:
        keys['s'] = random.randrange(maxInteresting)
        while keys['s'] in checked:
            keys['s'] = random.randrange(maxInteresting)
    else:
        raise "Trove error: Could not find a valid record"
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
    if thumb == "" or page == "" or title is None or title == "":
        checked.add(keys['s'])
        return findPicture(suburb, checked)
    return [title, thumb, page, work]
    
    
    
#res = findPicture('acton')
#print "title:     " + res[0]
#print "thumbnail: " + res[1]
#print "page:      " + res[2]