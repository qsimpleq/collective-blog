### Hexlet tests and linter status:
[![Actions Status](https://github.com/qsimpleq/collective-blog/workflows/hexlet-check/badge.svg)](https://github.com/qsimpleq/collective-blog/actions)
[![CI](https://github.com/qsimpleq/collective-blog/actions/workflows/ci.yml/badge.svg)](https://github.com/qsimpleq/collective-blog/actions/workflows/ci.yml)

# Collective blog

Each user can create an entry and publish it in one of the general categories, others users rate and comment on the added entries.

Link to service: [example-collective-blog](https://example-collective-blog.qsimpleq.su)

Deployed with self-hosted [dokku](https://dokku.com)

## Local development
```shell
make setup
make dev
```
### Extra commands
```shell
make lint
make test
make test-lint
make lint-test
make git-precommit-check
```
