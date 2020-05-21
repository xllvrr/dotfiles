# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## 2.0 - 2020-02-22

### Added
- Support for field `doi` in `@WWW`
 
### Changed
- New font scheme: `newtxtext`, `newtxtt` and `newtxmath`
- `utf8` is now the standard encoding for `inputenc`
- CODEN strings were removed from the BiBTeX style file
- Update documentation


## 1.5 - 2019-10-30

### Added
- New environment `funding`

### Changed
- Update documentation


## 1.4 - 2018-01-29

### Added
- New manuscript type `suppinfo`

### Changed
- Update documentation


## 1.3 - 2017-11-09

### Changed
- Loading of `cleveref` postponed till the end of the preamble in order to avoid problems with `hyperref`


## 1.2 - 2017-08-21

### Added
- Structure modified and files added for CTAN publication

### Changed
- Update documentation

### Fixed
- Option handling now compatible to recent `babel` versions
- `note` is only output once for `@misc` bib entries
- Fix for the declaration of `\-` as a robust command. There is a conflict between package `bpchem` and the latest `LaTeX` release


## 1.1 - 2010-08-16

### Fixed
- Page number bug fix


## 1.0 - 2010-05-11
First official release at BJNANO public website

