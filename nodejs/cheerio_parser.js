var cheerio = require('cheerio');
var fs = require('fs');

(function(){
    var filename = process.argv[2], n = parseInt(process.argv[3]);
    var enable_xpath = false;
    if(process.argv.length == 5 && process.argv[4] == 'true' ){
        enable_xpath = true;
    }
    var links;
    
    var html = fs.readFileSync(filename);
    
    var start = new Date();
    for (var i=0; i < n; i++) {
        var $ = cheerio.load(html);
        $._root

        if(enable_xpath) {
            links = $('a');
        }
    }
    var end = new Date();

    console.log('%d s', (end - start) / 1000);
    if(enable_xpath) {
        console.log('%d links', links.length)
    }
})()
