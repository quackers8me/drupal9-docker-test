lint:
	- docker run --rm -i -v ./hadolint.yaml hadolint/hadolint < Dockerfile

install:
	docker build . --file Dockerfile --tag drupal9-test:$(date +%s)

