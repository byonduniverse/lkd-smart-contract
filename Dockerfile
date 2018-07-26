# Lakediamond Dockerfile

# Start from ganache (testrpc) image
FROM trufflesuite/ganache-cli
LABEL maintainer="greg.boccard@lakediamond.ch"

## Install truffle
RUN apk add -t .gyp --no-cache git python g++ make \
    && npm install -g truffle \
    && apk del .gyp

RUN mkdir -p /dapp
# COPY . /dapp
WORKDIR /dapp

EXPOSE 7545
ENTRYPOINT ["node", "/src/build/cli.node.js"]