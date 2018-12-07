HTML parser standardize benchmark
======================

Simple HTML DOM parser benchmark in the most popular programming language.

The current platform support as of today.
 * c-libxml2
 * golang
 * java
 * nodejs
 * perl
 * python
 * ruby

The test can be run with Docker which greatly simplify the configuration process.

This project is sponsort by https://serpapi.com

How to run this ?
---
```bash
$ make all csv
$ cat report.csv
```

TODO
---
 - [x] Create a better report
 - [ ] Publish docker image to avoid build step
 - [x] Add support for more platforms
 - [ ] Add new platform rust
 - [ ] Add more real world tests selecting element in the dom
 
Note
---
This is on going update of an existing project which is 6 years old.

All Parsers - not all supported yet
---

### Ruby

* nokogiri
  http://nokogiri.org/
  HTML/XML parser based on libxml2

### PyPi

* BeautifulSoup 3
* BeautifulSoup 4
* html5lib
* lxml_parser

### Node.JS

* cheerio
  https://npmjs.org/package/cheerio
  Pure JS HTML DOM parser with jQuery API
* jsdom
  https://npmjs.org/package/jsdom
  Pure JS HTML DOM parser with rich browser-like API

### C

* libxml2
  http://xmlsoft.org/html/libxml-HTMLparser.html
  Written on C non-strict HTML parser.

### Perl

* Mojo::DOM
  http://search.cpan.org/~sri/Mojolicious-3.70/lib/Mojo/DOM.pm
  Written on Perl DOM parser, part of Mojolicious framework

### Go lang

* gokogiri
  https://github.com/moovweb/gokogiri
* go-html-transform
  https://code.google.com/p/go-html-transform
* exp/html
  http://tip.golang.org/pkg/exp/html

### PHP

* tidy + simplexml
  http://php.net/manual/ru/book.tidy.php http://php.net/manual/ru/book.simplexml.php
  Tidy - PHP extension for repearing broken HTML, simplexml - built-in libxml2 binding


### Java

* JSoup http://jsoup.org/


How to run this ?
-----------

### Create docker image
```
$>make build
```

### Install dependencies
```
$>make fetch_all
```

### Run all platform
```
$>make run_all
```

### Run specific platform and output a CSV file

```
make run csv platform=ruby repeat=20
```


How to add my $(platformname) to benchmark set?
----------------------------------------------

Create directory %platformname%

    mkdir $(platformname)

Create `run.sh` and `prepare.sh` scripts:

* `run.sh` - called every time when benchmark starts. Must use `print_header()`
  and `timeit()` functions from `lib.sh` to format output for each test.
  It must accept 2 arguments: HTML file path and number of iterations and pass
  them unchanged to benchmark scripts.
* `prepare.sh` - called only once, before runing any benchmarks. It can download
  dependencies, compile sources etc.

Create your benchmark scripts. Requirements:

* Must accept 2 arguments: path to HTML file and number of iterations
* Must read HTML file once, then perform "number of iterations" parse cycles
* Must print parser-loop runtime in seconds, calculated like
  `start = time(); do_n_iterations(N); print time() - start`
* On each iteration must build full DOM tree in memory

Add %platformname% to `platforms.txt` file.

How to add new HTML to benchmark?
---------------------------------

Just create HTML file named `page_<some_page_name>.html`.
