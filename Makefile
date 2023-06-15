.PHONY: setup dev erb2slim lint lint-rubocop lint-slim-lint test

setup:
	bundle install
	yarn install
	bundle exec rails assets:precompile

dev:
	bin/dev

erb2slim:
	bundle exec erb2slim app/views/ -d --trace

lint: lint-rubocop lint-slim-lint

lint-rubocop:
	bundle exec rubocop

lint-rubocop-fix:
	bundle exec rubocop -a

lint-rubocop-fixA:
	bundle exec rubocop -A

lint-slim-lint:
	bundle exec slim-lint app/views/

test:
	bundle exec rake test
