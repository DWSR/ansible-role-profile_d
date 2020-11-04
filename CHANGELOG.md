# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## [0.1.1] - 2020-11-03

### Fixes

* Pass `create: true` when amending the shell rc file instead of relying on a separate `file` module
  call to ensure that the file exists. This makes the role properly idempotent and slightly simpler.

## [0.1.0] - 2020-11-03

* Initial commit
