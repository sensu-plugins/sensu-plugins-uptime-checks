[![Sensu Bonsai Asset](https://img.shields.io/badge/Bonsai-Download%20Me-brightgreen.svg?colorB=89C967&logo=sensu)](https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-uptime-checks)
[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-uptime-checks.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-uptime-checks)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-uptime-checks.svg)](http://badge.fury.io/rb/sensu-plugins-uptime-checks)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-uptime-checks/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-uptime-checks)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-uptime-checks/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-uptime-checks)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-uptime-checks.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-uptime-checks)

## Sensu Plugins Uptime Checks Plugin

- [Overview](#overview)
- [Files](#files)
- [Usage examples](#usage-examples)
- [Configuration](#configuration)
  - [Sensu Go](#sensu-go)
    - [Asset registration](#asset-registration)
    - [Asset definition](#asset-definition)
    - [Check definition](#check-definition)
  - [Sensu Core](#sensu-core)
    - [Check definition](#check-definition)
- [Installation from source](#installation-from-source)
- [Additional notes](#additional-notes)
- [Contributing](#contributing)

### Overview

This plugin provides native instrumentation for collecting uptime and idletime metrics.

### Files
 * bin/check-uptime.rb
 * bin/metrics-uptime.rb
 
**check-uptime**
Checks the system's uptime and warns if the system has been rebooted.

**metrics-uptime**
Provides uptime metrics.

## Usage examples

### Help

**check-uptime.rb**
```
Usage: check-uptime.rb (options)
    -g, --greater-than               This compare uptime > threshold. Default behavior uptime < threshold
    -w SEC                           Warn threshold in SEC
```

**metrics-uptime.rb**
```
Usage: metrics-uptime.rb (options)
    -s, --scheme SCHEME              Metric naming scheme, text to prepend to metric
```

## Configuration
### Sensu Go
#### Asset registration

Assets are the best way to make use of this plugin. If you're not using an asset, please consider doing so! If you're using sensuctl 5.13 or later, you can use the following command to add the asset: 

`sensuctl asset add sensu-plugins/sensu-plugins-uptime-checks`

If you're using an earlier version of sensuctl, you can download the asset definition from [this project's Bonsai asset index page](https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-uptime-checks).

#### Asset definition

```yaml
---
type: Asset
api_version: core/v2
metadata:
  name: sensu-plugins-uptime-checks
spec:
  url: https://assets.bonsai.sensu.io/65a0f4378e92721cf5565e3be73bbe30632df6c7/sensu-plugins-uptime-checks_3.1.0_centos_linux_amd64.tar.gz
  sha512: 2c0337391edfafa308c18bec7cae1c641012d6225c92d7bba98c79665e34311a2b13250a60b5b0074da82b274355e4715bca73c1b428b04132cd8152e39d120f
```

#### Check definition

```yaml
---
type: CheckConfig
spec:
  command: "check-uptime.rb"
  handlers: []
  high_flap_threshold: 0
  interval: 10
  low_flap_threshold: 0
  publish: true
  runtime_assets:
  - sensu-plugins/sensu-plugins-uptime-checks
  - sensu/sensu-ruby-runtime
  subscriptions:
  - linux
```

### Sensu Core

#### Check definition
```json
{
  "checks": {
    "check-uptime": {
      "command": "check-uptime.rb",
      "subscribers": ["linux"],
      "interval": 10,
      "refresh": 10,
      "handlers": ["influxdb"]
    }
  }
}
```

## Installation from source

### Sensu Go

See the instructions above for [asset registration](#asset-registration).

### Sensu Core

Install and setup plugins on [Sensu Core](https://docs.sensu.io/sensu-core/latest/installation/installing-plugins/).

## Additional notes

### Sensu Go Ruby Runtime Assets

The Sensu assets packaged from this repository are built against the Sensu Ruby runtime environment. When using these assets as part of a Sensu Go resource (check, mutator, or handler), make sure to include the corresponding [Sensu Ruby Runtime Asset](https://bonsai.sensu.io/assets/sensu/sensu-ruby-runtime) in the list of assets needed by the resource.

## Contributing

See [CONTRIBUTING.md](https://github.com/sensu-plugins/sensu-plugins-uptime-checks/blob/master/CONTRIBUTING.md) for information about contributing to this plugin.
