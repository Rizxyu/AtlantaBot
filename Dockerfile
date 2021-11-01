FROM pm2:5.1.2-buster

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  chromium \
  ffmpeg \
  wget \
  mc \
  imagemagick && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .
RUN npm install -g npm@7.20.5
RUN npm install

COPY . .

EXPOSE 5000

CMD ["pm2", "start", "atlanta.js"]`
