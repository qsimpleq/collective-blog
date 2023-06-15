.PHONY: setup dev lint lint-rubocop lint-slim-lint test

setup:
	bundle install
	yarn install
	bundle exec rails assets:precompile

dev:
	bundle exec rails server

lint: lint-rubocop	lint-slim-lint

lint-rubocop:
	bundle exec rubocop -a

lint-slim-lint:
	bundle exec slim-lint app/views/

test:
	bundle exec rake test
