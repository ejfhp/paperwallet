package main

import (
	"fmt"
	"net/http"
	"os"
	"path/filepath"

	"github.com/julienschmidt/httprouter"
)

//LocalDir implements http.FileSystem but doesn't allow dir list
type LocalDir struct {
	path string
}

func (ld *LocalDir) Open(name string) (http.File, error) {
	path := filepath.Join(ld.path, name)
	f, err := os.Open(path)
	if err != nil {
		return nil, fmt.Errorf("cannot access file: %s", path)
	}
	stat, err := f.Stat()
	if err != nil {
		return nil, fmt.Errorf("cannot get stat of file: %s", path)
	}
	if stat.IsDir() {
		return nil, fmt.Errorf("dir list not allowed: %s", path)
	}
	return f, nil
}

//PageHandler implements httprouter.Handle and serve static content from a local dir
type PageHandler struct {
	fileServer http.Handler
}

func NewPageHandler(prefix, localPath string) *PageHandler {
	ld := LocalDir{path: localPath}
	fs := http.StripPrefix(prefix, http.FileServer(&ld))
	return &PageHandler{fileServer: fs}
}

func (s *PageHandler) LocalFile(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	fmt.Printf("Request: %s   file: %s\n", r.RequestURI, ps.ByName("file"))
	s.fileServer.ServeHTTP(w, r)
}

//go:generate go run buildscript/includekey.go
func main() {
	fmt.Printf("Starting paper wallet - ready to give the world a lot of Bitcoin BSV...\n")
	router := httprouter.New()
	router.GET("/*file", NewPageHandler("/", "./").LocalFile)
	err := http.ListenAndServe(":8080", router)
	if err != nil {
		fmt.Printf("ListenAndServe failed: %v\n", err)
	}
}
