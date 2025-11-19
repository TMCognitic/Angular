FROM node:24-bookworm-slim

EXPOSE 4200

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git
RUN git config --global user.email "thierry.morre@cognitic.be"
RUN git config --global user.name "Thierry Morre"
RUN git config --global init.defaultBranch main

RUN npm install -g @angular/cli
RUN ng analytics disable --global true
RUN ng n demoApp --routing=true --skip-tests --style=scss --interactive=false 
WORKDIR /app/demoApp

CMD ["ng", "serve", "--host", "0.0.0.0"]

