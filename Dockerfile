FROM hexletbasics/base-image:latest

RUN apt-get update
RUN apt-get install -y haskell-platform libghc-hspec-dev

WORKDIR /exercises-haskell

COPY . .

ENV PATH /exercises-haskell/bin:$PATH
