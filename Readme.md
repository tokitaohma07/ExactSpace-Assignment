# README.md - Documentation

# Web Scraper & Flask API

This project scrapes web content using Puppeteer and serves the extracted data using Flask.

## Setup

### Build Docker Image
```sh
docker build --build-arg SCRAPE_URL=https://example.com -t web-scraper .
```

### Run the Container
```sh
docker run -p 5000:5000 web-scraper
```

### Access Scraped Data
Open your browser and go to:
```
http://localhost:5000/
```
