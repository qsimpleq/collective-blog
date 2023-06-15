setup:
	bundle install
	yarn install
	bundle exec rails assets:precompile

dev:
	bundle exec rails server

lint: lint-ruby	lint-templates

lint-ruby:
	bundle exec rubocop -a

lint-templates:
	bundle exec slim-lint app/views/
