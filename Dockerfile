# Stage 1: Scraper (Node.js + Puppeteer)
FROM node:18-slim AS scraper

RUN apt-get update && apt-get install -y chromium

WORKDIR /app

COPY package.json .
RUN npm install

COPY scrape.js .

ARG SCRAPE_URL=https://example.com
ENV SCRAPE_URL=$SCRAPE_URL
RUN node scrape.js


# Stage 2: Server (Python + Flask)
FROM python:3.10-slim AS server

WORKDIR /app

COPY --from=scraper /app/scraped_data.json /app/scraped_data.json

COPY server.py .
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "server.py"]
