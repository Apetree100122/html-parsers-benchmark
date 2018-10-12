// Created by github.com/programmerby on 2012-12-26
// Part of github.com/seriyps/html-parsers-benchmark
package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"time"

	"github.com/moovweb/gokogiri"
	"github.com/moovweb/gokogiri/xml"
)

func main() {
	if len(os.Args) < 3 {
		fmt.Println("Usage:", os.Args[0], "filename iteration enable_xpath")
		os.Exit(1)
	}

	filename := os.Args[1]
	n, _ := strconv.Atoi(os.Args[2])

	enableXpath := false
	if len(os.Args) == 4 {
		if os.Args[3] == "true" {
			enableXpath = true
		}
	}

	file, err := ioutil.ReadFile(filename)
	if err != nil {
		panic(err)
	}

	start := time.Now()
	var links []xml.Node
	for i := 0; i < n; i++ {
		doc, err := gokogiri.ParseHtml(file)
		if err != nil {
			panic(err)
		}
		doc.Root()

		if enableXpath {
			links, _ = doc.Search("//a")
			if links == nil {
				panic("fail to find links")
			}
		}

		doc.Free()
	}
	end := time.Now()

	fmt.Printf("%f s\n", end.Sub(start).Seconds())

	if enableXpath {
		fmt.Printf("%d links\n", len(links))
	}
}
