# crystal-bb

This is intended to be a customizable web forum similar to phpbb.

[![Amber Framework](https://img.shields.io/badge/using-amber_framework-orange.svg)](https://amberframework.org)

## Getting Started

This is easiest to start up with pg in a docker container exposed locally.
0. `shards install && shards build`
1. `docker-compose up db`
2. `amber db create migrate seed`
3. `amber watch`

You should now have a user `admin@example.com` with a password of `password`.  The server is exposed on port 4000, and the pg container exposes `localhost:5432`

## Prerequisites

This project requires [Crystal](https://crystal-lang.org/) ([installation guide](https://crystal-lang.org/docs/installation/)).

## Tests

To run the test suite:

```
crystal spec
```
