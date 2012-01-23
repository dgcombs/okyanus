##
## Okyanus -- Ocean
## (c) 2012 Dan McGinn-Combs
##
## Front End for Solr
## Online Search of Baha'i Writings
##
##
##
## use strict;

## My global modules are located 
node_modules = "/Users/Dan McGinn-Combs/AppData/Roaming/NPM/node_modules/"
http=require('http')
    , rest=require(node_modules+'restler')
	, jade=require(node_modules+'jade')
	, sys = require('util')

app=require(node_modules+'express').createServer()

app.get('/',->(req,res)
	res.send('hello, world')
);

app.get('/twitter',->(req,res)
	rest.get('http://api.twitter.com/1/statuses/public_timeline.xml').on('complete',function(data)
		sys.puts(data);
	);
);

app.listen(3000);