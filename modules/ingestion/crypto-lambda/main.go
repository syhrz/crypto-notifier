package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"github.com/aws/aws-lambda-go/lambda"
	"net/http"
)

func readJSONFromUrl(url string) ([]Currency, error) {
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}

	defer resp.Body.Close()
	var currencies []Currency
	buf := new(bytes.Buffer)
	buf.ReadFrom(resp.Body)
	respByte := buf.Bytes()
	if err := json.Unmarshal(respByte, &currencies); err != nil {
		return nil, err
	}

	return currencies, nil
}

type Event struct {
	Url string `json:"Url"`
}

type DataSource struct {
	content string
}

type Response struct {
	Output string `json:"Output:"`
}

type Currency struct {
	Date            int64   `json:"date"`
	High            float64 `json:"high"`
	Low             float64 `json:"low"`
	Open            float64 `json:"open"`
	Close           float64 `json:"close"`
	Volume          float64 `json:"volume"`
	QuoteVolume     float64 `json:"quoteVolume"`
	WeightedAverage float64 `json:"weightedAverage"`
}

func HandleLambdaEvent(event Event) (Response, error) {
	datasource, err := readJSONFromUrl(event.Url)
	if err != nil {
		panic(err)
	}

	return Response{Output: fmt.Sprintf("%s", datasource)}, nil
}

func main() {
	lambda.Start(HandleLambdaEvent)
}
