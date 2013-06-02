from lxml import etree
import urllib
import random
from settings import TROVE_API_KEY, TROVE_BASE

maxInteresting = 20

def findPicture(suburb):
    keys = {'key' : TROVE_API_KEY}
    keys['zone'] = 'picture'
    #key words
    keys['q'] = 'ACT ' + suburb
    keys['l-availability'] = 'y/f'
    keys['l-australian'] = 'y'
    keys['include'] = 'links'
    keys['s'] = random.randrange(maxInteresting)
    keys['n'] = 1
    keyStr = urllib.urlencode(keys)
    resTree = etree.parse(TROVE_BASE + keyStr)
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
    return {'title': title, 'thumb_uri': thumb, 'link': page, 'xml': work}