package routes

import (
	"github.com/gin-gonic/gin"
	"tcg-collector/internal/handlers"
	"tcg-collector/internal/utilities"
)

func RegisterRoutes(r *gin.Engine) {
	auth := r.Group("/auth")
	{
		auth.POST("/login", func(c *gin.Context) {})
	}

	api := r.Group("/api")
	api.Use(utilities.IsAuthorized())
	{
		api.GET("/sets", handlers.GetSets)
		api.GET("/cards", handlers.GetCards)
		api.GET("/cards/by/set", handlers.GetCardsBySet)
	}
}
