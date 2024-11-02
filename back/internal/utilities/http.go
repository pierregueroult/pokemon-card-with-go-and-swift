package utilities

import (
	"encoding/json"
	"io"
	"net/http"
)

func Fetch(url string, headers map[string]string, result interface{}) string {
	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return "Error creating request"
	}

	for key, value := range headers {
		req.Header.Set(key, value)
	}

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		return "Error sending request"
	}

	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return "Error reading response"
	}

	err = json.Unmarshal(body, result)
	if err != nil {
		return err.Error()
	}

	return ""
}
