FROM hexletbasics/base-image:latest AS toolchain

RUN apt-get update \
    && apt-get install -y --no-install-recommends ghc libghc-hspec-dev \
    && rm -rf /var/lib/apt/lists/* \
    && ghc --version \
    && ghc-pkg latest hspec

FROM toolchain AS course

WORKDIR /exercises-haskell
COPY . .

ENV PATH="/exercises-haskell/bin:$PATH"
