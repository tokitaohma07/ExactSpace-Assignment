# README.md - Documentation

# Web Scraper & Flask API

# Step 1: Implement scrape.js (Node.js Scraper)

This script will:
Accept a URL from an environment variable.
Use Puppeteer to open the URL in a headless Chromium browser.
Extract the page title and first heading.
Save the scraped data as scraped_data.json.

# Step 2: Implement server.py (Flask Server)

This script will:
Read scraped_data.json from the filesystem.
Serve the scraped content as JSON via an HTTP endpoint.

# Step 3: Define Dependencies (package.json)

We'll need dependency files for both Node.js and Python.
package.json (Node.js Dependencies)

# Stage 4:  Dcokerfile

Node.js Scraper

# Stage 5: Requirements.txt

Flask requirements


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
