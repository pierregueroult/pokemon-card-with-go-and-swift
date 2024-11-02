package utilities

import "github.com/gin-gonic/gin"

func IsAuthorized() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Next()
	}
}
