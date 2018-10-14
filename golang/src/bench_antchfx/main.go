// Created by github.com/programmerby on 2012-12-26
// Part of github.com/seriyps/html-parsers-benchmark
package main

import (
	"fmt"
	"os"
	"strconv"
	"time"

	"github.com/antchfx/xquery/html"
)

func main() {
	var linkCount int

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

	file, err := os.Open(filename)
	if err != nil {
		panic(err)
	}

	start := time.Now()
	for i := 0; i < n; i++ {
		// Parse HTML document.
		doc, err := htmlquery.Parse(file)
		if err != nil {
			panic(err)
		}

		if enableXpath {
			// Extremly buggy API
			i := len(htmlquery.Find(doc, "//a/@href"))
			if i > 0 {
				linkCount = i
			}
		}
		doc = nil
	}
	end := time.Now()

	fmt.Printf("%f s\n", end.Sub(start).Seconds())

	if enableXpath {
		fmt.Printf("%d links\n", linkCount)
	}
}
