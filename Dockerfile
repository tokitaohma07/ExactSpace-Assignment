### Multi-stage Dockerfile

# Stage 1: Scraper (Node.js + Puppeteer)
FROM node:18-slim AS scraper

# Install dependencies
RUN apt-get update && apt-get install -y chromium

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy scraper script
COPY scrape.js .

# Run the scraper with a default URL (can be overridden at runtime)
ARG SCRAPE_URL=https://example.com
ENV SCRAPE_URL=$SCRAPE_URL
RUN node scrape.js


# Stage 2: Server (Python + Flask)
FROM python:3.10-slim AS server

# Set working directory
WORKDIR /app

# Copy required files from the scraper stage
COPY --from=scraper /app/scraped_data.json /app/scraped_data.json

# Copy server files
COPY server.py .
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 5000

# Run Flask server
CMD ["python", "server.py"]
