package models

type Card struct {
	ID                     string          `json:"id"`
	Name                   string          `json:"name"`
	SuperType              string          `json:"supertype"`
	SubTypes               []string        `json:"subtypes"`
	Level                  string          `json:"level"`
	HP                     string          `json:"hp"`
	Types                  []string        `json:"types"`
	EvolvesFrom            string          `json:"evolvesFrom"`
	EvolvesTo              []string        `json:"evolvesTo"`
	Rules                  []string        `json:"rules"`
	AncientTrait           []AncientsTrait `json:"ancientTrait"`
	Abilities              []Ability       `json:"abilities"`
	Attacks                []Attack        `json:"attacks"`
	Weaknesses             []Weakness      `json:"weaknesses"`
	Resistances            []Resistance    `json:"resistances"`
	RetreatCost            []string        `json:"retreatCost"`
	ConvertedRetreatCost   int             `json:"convertedRetreatCost"`
	Set                    Set             `json:"set"`
	Number                 string          `json:"number"`
	Artist                 string          `json:"artist"`
	Rarity                 string          `json:"rarity"`
	FlavorText             string          `json:"flavorText"`
	NationalPokedexNumbers []int           `json:"nationalPokedexNumbers"`
	Legalities             Legalities      `json:"legalities"`
	RegulationMark         string          `json:"regulationMark"`
	Images                 Images          `json:"images"`
	TcgPlayer              TcgPlayer       `json:"tcgplayer"`
	CardMarket             CardMarket      `json:"cardmarket"`
}

type AncientsTrait struct {
	Name string `json:"name"`
	Text string `json:"text"`
}

type Ability struct {
	Name string `json:"name"`
	Text string `json:"text"`
	Type string `json:"type"`
}

type Attack struct {
	Cost                []string `json:"cost"`
	Name                string   `json:"name"`
	Text                string   `json:"text"`
	Damage              string   `json:"damage"`
	ConvertedEnergyCost int      `json:"convertedEnergyCost"`
}

type Weakness struct {
	Type  string `json:"type"`
	Value string `json:"value"`
}

type Resistance struct {
	Type  string `json:"type"`
	Value string `json:"value"`
}

type Legalities struct {
	Standard  string `json:"standard"`
	Expanded  string `json:"expanded"`
	Unlimited string `json:"unlimited"`
}

type Images struct {
	Small string `json:"small"`
	Large string `json:"large"`
}

type TcgPlayer struct {
	Url       string    `json:"url"`
	UpdatedAt string    `json:"updatedAt"`
	Prices    TcgPrices `json:"prices"`
}

type TcgPrices struct {
	Low       float64 `json:"low"`
	Mid       float64 `json:"mid"`
	High      float64 `json:"high"`
	Market    float64 `json:"market"`
	DirectLow float64 `json:"directLow"`
}

type CardMarket struct {
	Url       string           `json:"url"`
	UpdatedAt string           `json:"updatedAt"`
	Prices    CardMarketPrices `json:"prices"`
}

type CardMarketPrices struct {
	AverageSellPrice float64 `json:"averageSellPrice"`
	LowPrice         float64 `json:"lowPrice"`
	TrendPrice       float64 `json:"trendPrice"`
	GermanProLow     float64 `json:"germanProLow"`
	SuggestedPrice   float64 `json:"suggestedPrice"`
	ReverseHoloSell  float64 `json:"reverseHoloSell"`
	ReverseHoloLow   float64 `json:"reverseHoloLow"`
	ReverseHoloTrend float64 `json:"reverseHoloTrend"`
	LowPriceExPlus   float64 `json:"lowPriceExPlus"`
	Avg1             float64 `json:"avg1"`
	Avg7             float64 `json:"avg7"`
	Avg30            float64 `json:"avg30"`
	ReverseHoloAvg1  float64 `json:"reverseHoloAvg1"`
	ReverseHoloAvg7  float64 `json:"reverseHoloAvg7"`
	ReverseHoloAvg30 float64 `json:"reverseHoloAvg30"`
}
