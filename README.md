## Sensu-Plugins-uptime-checks

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-uptime-checks.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-uptime-checks)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-uptime-checks.svg)](http://badge.fury.io/rb/sensu-plugins-uptime-checks)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-uptime-checks/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-uptime-checks)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-uptime-checks/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-uptime-checks)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-uptime-checks.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-uptime-checks)

## Functionality

## Files
 * bin/metrics-uptime

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-uptime-checks -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-uptime-checks`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-uptime-checks' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-uptime-checks' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
