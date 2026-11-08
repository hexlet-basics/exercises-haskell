.DEFAULT_GOAL := compose-setup

-include /opt/basics/common/common.mk

check: support-test

support-test:
	timeout --kill-after=5s 30s runhaskell -ilib test/Spec.hs

compose-setup: compose-build

compose:
	docker compose up

compose-build:
	docker compose build

code-lint:
	ghc -fno-code -Wall -Werror lib/ExerciseTest.hs

compose-bash:
	docker compose run --rm exercises bash

compose-test:
	docker compose run --rm exercises make test

compose-description-lint:
	docker compose run --rm exercises make description-lint

compose-schema-validate:
	docker compose run --rm exercises make schema-validate

ci-check:
	docker compose build
	docker compose up --abort-on-container-exit --exit-code-from exercises
