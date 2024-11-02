package models

type Set struct {
	Id           string `json:"id"`
	Name         string `json:"name"`
	Series       string `json:"series"`
	PrintedTotal int    `json:"printedTotal"`
	Total        int    `json:"total"`
	Legalities   struct {
		Unlimited string `json:"unlimited"`
		Standard  string `json:"standard"`
		Expanded  string `json:"expanded"`
	} `json:"legalities"`
	PtcgoCode   string `json:"ptcgoCode"`
	ReleaseDate string `json:"releaseDate"`
	UpdatedAt   string `json:"updatedAt"`
	Images      struct {
		Logo   string `json:"logo"`
		Symbol string `json:"symbol"`
	} `json:"images"`
}
