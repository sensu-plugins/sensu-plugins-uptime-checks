# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This Changelog following the conventions laid out [here](https://github.com/sensu-plugins/community/blob/master/HOW_WE_CHANGELOG.md)

## [Unreleased]

### Changed
- updated PR template and CHANGELOG to point to new CHANGELOG guidelines (@majormoses)

### Added
- Ruby 2.4 testing (@Evesy)
- check-uptime.rb: added `--greater-than` option to change the comparison operator to determine if threshold is exceeded (@Juan-Moreno)

## [1.1.0] - 2016-11-13
### Added
- New check `check-uptime.rb` that checks system uptime and warns if the system has been rebooted (@remmelz)

## [1.0.0] - 2016-06-16
### Changed
- Loosen dependency on sensu-plugin from `= 1.2.0` to `~> 1.2`
- Update Rubocop to 0.40, apply auto-correct

### Removed
- Remove Ruby 1.9.3 support; add Ruby 2.3.0 support to test matrix

## [0.0.4] - 2015-12-14
### Changed
- change ruby wrapper to standalone script

## [0.0.3] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## [0.0.2] - 2015-06-03
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-05-21
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-uptime-checks/compare/1.1.0...HEAD
[1.1.0]: https://github.com/sensu-plugins/sensu-plugins-uptime-checks/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-uptime-checks/compare/0.0.4...1.0.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-uptime-checks/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-uptime-checks/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-uptime-checks/compare/0.0.1...0.0.2
