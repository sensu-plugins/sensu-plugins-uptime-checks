#! /usr/bin/env ruby
#  encoding: UTF-8
#
#   check-uptime
#
# DESCRIPTION:
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#   check-uptime.rb --help
#
# NOTES:
#   Checks the uptime of the system and warns the user if the system
#   has been crashed or rebooted.
#
# LICENSE:
#   Copyright 2012 Kees Remmelzwaal <kees@fastmail.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#
require 'sensu-plugin/check/cli'

class CheckUptime < Sensu::Plugin::Check::CLI

  option :warn,
         short: '-w WARN',
         proc: proc(&:to_i),
         default: 180 

  def run

    uptime_sec  = IO.read('/proc/uptime').split[0].to_i
    uptime_date = Time.now - uptime_sec

    if uptime_sec < config[:warn]
      message "System boot detected (#{uptime_sec} seconds up)"
      warning
    end

    message "System booted at #{uptime_date}"
    ok
  end
end



