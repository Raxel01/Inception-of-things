package main

import (
	"log"
	"net/http"
)

func main() {
	// http.FileServer automatically serves index.html for a directory request.
	// We handle all requests from the root URL ("/") by serving the "./static" directory.
	// The pattern "/" matches all request paths.
	http.Handle("/", http.FileServer(http.Dir("./static")))

	log.Println("Server starting on port 8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
