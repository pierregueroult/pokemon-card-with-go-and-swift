package handlers

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"os"
	"tcg-collector/internal/constants"
	"tcg-collector/internal/models"
	"tcg-collector/internal/utilities"
)

const setsUrl = constants.ApiUrl + "/sets"

func GetSets(c *gin.Context) {

	quantity := c.Query("quantity")
	if quantity == "" {
		quantity = "10"
	}

	page := c.Query("page")
	if page == "" {
		page = "1"
	}

	fullUrl := setsUrl + "?pageSize=" + quantity + "&page=" + page
	apiKey := os.Getenv("POKEMON_CARD_API_KEY")

	if apiKey == "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "API Key not found",
		})
		return
	}

	headers := map[string]string{
		"X-Api-Key":    apiKey,
		"Content-Type": "application/json",
	}

	var responseSetList models.ResponseSetList
	err := utilities.Fetch(fullUrl, headers, &responseSetList)
	if err != "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}

	c.JSON(http.StatusOK, responseSetList)
}
