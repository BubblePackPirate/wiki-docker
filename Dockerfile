FROM ubuntu:16.04
#FROM mongo:latest

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
WORKDIR /var/wiki

# Install prerequisites
RUN apt-get update && apt-get install curl locate nano build-essential git libssl-dev -y

# Install MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
    echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list && \
    apt-get update && \
    groupadd -r mongodb && useradd -r -g mongodb mongodb && \
    apt-get install -y mongodb-org

#Install Node.js + wiki.js
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash && \
      source /root/.nvm/nvm.sh && nvm ls-remote && nvm install node && nvm use node && \
      npm install -g node-gyp && curl -sSo- https://wiki.js.org/install.sh | bash

COPY entrypoint.sh .
COPY config.yml .
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ./entrypoint.sh
EXPOSE 3000
