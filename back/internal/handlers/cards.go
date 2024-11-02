package handlers

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"os"
	"tcg-collector/internal/constants"
	"tcg-collector/internal/models"
	"tcg-collector/internal/utilities"
)

const cardsUrl = constants.ApiUrl + "/cards"

func GetCards(c *gin.Context) {
	quantity := c.Query("quantity")
	if quantity == "" {
		quantity = "10"
	}

	page := c.Query("page")
	if page == "" {
		page = "1"
	}

	fullUrl := cardsUrl + "?pageSize=" + quantity + "&page=" + page
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

	var responseCardList models.ResponseCardList
	err := utilities.Fetch(fullUrl, headers, &responseCardList)
	if err != "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}

	c.JSON(http.StatusOK, responseCardList)
}

func GetCardsBySet(c *gin.Context) {
	quantity := c.Query("quantity")
	if quantity == "" {
		quantity = "10"
	}

	page := c.Query("page")
	if page == "" {
		page = "1"
	}

	set := c.Query("set")
	if set == "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Set is required",
		})
		return
	}

	fullUrl := cardsUrl + "?pageSize=" + quantity + "&page=" + page + "&orderBy=number&q=set.id:" + set

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

	var responseCardList models.ResponseCardList
	err := utilities.Fetch(fullUrl, headers, &responseCardList)
	if err != "" {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}

	c.JSON(http.StatusOK, responseCardList)
}
