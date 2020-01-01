package main

import (
	"encoding/json"
	"fmt"
	"net/http"
  "github.com/mattn/go-gimei"
)

func main() {
	http.HandleFunc("/user/", userHandler)

	http.ListenAndServe(":8080", nil)
}

type User struct {
	ID     uint   `json:"id"`
	Name   string `json:"name"`
	Gender string `json:"gender"`
}

func userHandler(w http.ResponseWriter, r *http.Request) {
	var id uint
	if _, err := fmt.Sscanf(r.URL.Path, "/user/%d", &id); err != nil {
		w.Write([]byte(err.Error()))
		return
	}
	name := gimei.NewName()

	user := User{
		ID:     id,
		Name:   name.Kanji(),
		Gender: "male",
	}
	w.Header().Set("Content-Type", "application/json;charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(user)
}
