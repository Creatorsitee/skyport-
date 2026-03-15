FROM node:22-bookworm

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone repo skyport
RUN git clone https://github.com/skyport-team/panel .

# Install dependencies
RUN npm install
RUN npm link

# Copy script eksekusi
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Port default Skyport
EXPOSE 3000

CMD ["bash", "entrypoint.sh"]
