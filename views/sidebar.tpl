%if undefined == True:
    <p></p>
%else:
    <h2>A blast from the past in...</h2>
    <h1 id="sidebar-keyword">{{keyword}}</h1>
    <a href="{{link}}" target="_blank"><img id="sidebar-img" src="{{thumb_uri}}"></a>
    <p id="sidebar-title">{{title}}</p>
    <a href="{{link}}" target="_blank">See more &rarr;</a>
<br><br><a href="http://trove.nla.gov.au/" target="_blank"><img src="assets/img/trove-API-logo-dark.png" alt="Powered by Trove"/></a>
%end