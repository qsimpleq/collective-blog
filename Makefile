.PHONY: setup deploy-railway-app dev erb2slim git-precommit-check lint lint-rubocop lint-templates test test-lint lint-test

setup:
	bundle install --jobs 4 --retry 3
	yarn install
	bundle exec rails db:create db:migrate db:seed assets:precompile

dev:
	bin/dev

erb2slim:
	bundle exec erb2slim app/views/ -d --trace

lint: lint-rubocop lint-templates

lint-rubocop:
	bundle exec rubocop

lint-rubocop-fix:
	bundle exec rubocop -a

lint-rubocop-fiX:
	bundle exec rubocop -A

lint-templates:
	bundle exec slim-lint app/views/

test:
	bundle exec rake test

lint-test: lint test
test-lint: test lint

git-precommit-check: setup test lint

deploy-dokku: git-precommit-check
	git push dokku main
