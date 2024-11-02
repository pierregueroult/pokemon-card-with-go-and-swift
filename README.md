# Pokemon Card with Go and Swift

## Overview
This project is a web application that allows users to view Pokemon cards. The backend is built with Go, and the frontend is developed using Swift.
This project was to test new language (go and swift that I never used before)

## Table of Contents
- [Pokemon Card with Go and Swift](#pokemon-card-with-go-and-swift)
    - [Overview](#overview)
    - [Table of Contents](#table-of-contents)
    - [Backend](#backend)
        - [Technologies](#technologies)
        - [Setup](#setup)
        - [Usage](#usage)
    - [Frontend](#frontend)
        - [Technologies](#technologies-1)
        - [Setup](#setup-1)
        - [Usage](#usage-1)
    - [Contributing](#contributing)
    - [License](#license)

## Backend

### Technologies
- Go
- Gin (Go web framework)

### Setup
1. Clone the repository: `git clone https://github.com/pierregueroult/pokemon-card-with-go-and-swift.git`
2. Navigate to the backend directory: `cd backend`
3. Install dependencies: `go mod tidy`
4. Set up environment variables (if any): `.env`
5. Start the server: `go run main.go`

### Usage
- API endpoints for getting information about sets and cards
- The backend is just a REST API based on the tcg pokemon API

## Frontend

### Technologies
- Swift
- SwiftUI

### Setup
1. Navigate to the frontend directory: `cd frontend`
2. Open the project in Xcode: `open PokemonCard.xcodeproj`
3. Start the development server: Run the project in Xcode

### Usage
- Main features: Viewing all existing sets

## Contributing
1. Fork the repository
2. Create a new branch
3. Submit a pull request