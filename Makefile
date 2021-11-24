lint:
	- docker run --rm -i -v ./hadolint.yaml hadolint/hadolint < Dockerfile

install:
	docker build . --file Dockerfile --tag local/drupal9-test:latest

