%if undefined == True:
    <p></p>
%else:
    <h2>A blast from the past in...</h2>
    <h1>{{keyword}}</h1>
    <a href="{{link}}"><img id="sidebar-img" src="{{thumb_uri}}"></a>
    <p>{{title}}</p>
%end