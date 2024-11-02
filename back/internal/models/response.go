package models

type ResponseCardList struct {
	Count      int    `json:"count"`
	Data       []Card `json:"data"`
	Page       int    `json:"page"`
	PageSize   int    `json:"pageSize"`
	TotalCount int    `json:"totalCount"`
}

type ResponseSetList struct {
	Count    int   `json:"count"`
	Data     []Set `json:"data"`
	Page     int   `json:"page"`
	PageSize int   `json:"pageSize"`
}
