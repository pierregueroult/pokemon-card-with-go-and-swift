package main

import (
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"tcg-collector/internal/routes"
)

func init() {
	err := godotenv.Load()

	if err != nil {
		println("No .env file found.")
	}
}

func main() {

	r := gin.New()

	r.Use(gin.Logger())
	r.Use(gin.Recovery())

	routes.RegisterRoutes(r)

	err := r.Run(":8080")

	if err != nil {
		panic(err)
	}
}
