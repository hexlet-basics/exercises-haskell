FROM hexletbasics/base-image:latest

RUN apt-get update
RUN apt-get install -y haskell-platform

RUN cabal update && cabal install --package-env=. --lib hspec hspec-contrib QuickCheck HUnit

WORKDIR /exercises-haskell

COPY . .

ENV PATH /exercises-haskell/bin:$PATH
