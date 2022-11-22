package main

import (
	"fmt"
	"github.com/prometheus/procfs/sysfs"
	"log"
	"net/http"
)

func main() {

	fs, err := sysfs.NewFS("/sys")
	if err != nil {
		panic(err)
	}
	netDevices, err := fs.NetClassDevices()

	http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		for _, device := range netDevices {
			_, err := fs.NetClassByIface(device)
			if err != nil {
				panic(err)
			}
		}
		fmt.Printf(". ")
		writer.WriteHeader(200)
		writer.Write([]byte("ok"))
	})
	log.Fatal(http.ListenAndServe(":9100", nil))
}
