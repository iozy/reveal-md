FROM node:lts-alpine

COPY package.json package-lock.json /app/

WORKDIR /app

RUN wget -P lib/ https://cdn.jsdelivr.net/npm/mermaid@10.4.0/dist/mermaid.min.js https://raw.githubusercontent.com/amra/reveal-md-scripts/master/mermaidjs/reveal-mermaid.js
RUN wget https://raw.githubusercontent.com/amra/reveal-md-scripts/master/mermaidjs/reveal-md.json

# First install dependencies
RUN npm install --production

# Install app
COPY . /app

EXPOSE 1948

WORKDIR /slides
ENTRYPOINT [ "node", "/app/bin/reveal-md.js" ]
CMD [ "/slides" ]
