// Created on 2012-12-15
// @author: Sergey Prokhorov <me@seriyps.ru>

var jsdom = require("jsdom");
var fs = require('fs');
const { JSDOM } = jsdom;

var filename = process.argv[2], n = parseInt(process.argv[3]);
var enable_xpath = false;
if(process.argv.length == 5 && process.argv[4] == 'true' ){
    enable_xpath = true;
}

if(filename.match(/habrahabr/))
 {
    console.log("100.00 s");
    console.error("page too big for JSDOM");
    return 1;
}

var html = fs.readFileSync(filename);
var links;
var start = new Date();
for (var i=0; i < n; i++) {
    var dom = new JSDOM(html);

    if(enable_xpath) {
        links = dom.window.document.querySelectorAll("a");
    }

/*                        null,
                    {features: {
                        FetchExternalResources: false,
                        ProcessExternalResources: false
                    }});*/
}
var end = new Date();

console.log('%d s', (end - start) / 1000);

if(enable_xpath) {
    console.log("%d links", links.length)
}
