# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 1.2.0 - 2023-03-04

### Added
- User can pass more than one `TSV_FILE`, i.e. changed the arity of `TSV_FILE`
  positional argument from "0 to 1" to "0 to n"

### Fixed
- no error, if the version of `column` utility installed on the system doesn't
  support long option names

## 1.1.0 - 2023-03-04

### Added
- `-V`, `--verision` option
- this CHANGELOG

### Changed
- usage text
- error messages are prefixed with the name of the script
