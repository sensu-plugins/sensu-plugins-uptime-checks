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
#   Checks the systems uptime and warns if the system has been rebooted.
#   2017 Juan Moreno Martinez - Add reverse option
#
# LICENSE:
#   Copyright 2012 Kees Remmelzwaal <kees@fastmail.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'

class CheckUptime < Sensu::Plugin::Check::CLI
  option :warn,
         short: '-w SEC ',
         description: 'Warn threshold in SEC',
         proc: proc(&:to_i),
         default: 180

  option :greater,
         short: '-g',
         long: '--greater-than',
         description: 'This compare uptime > threshold. Default behavior uptime < threshold',
         boolean: true,
         default: false

  def run
    uptime_sec  = IO.read('/proc/uptime').split[0].to_i
    uptime_date = Time.now - uptime_sec

    if config[:greater] && uptime_sec > config[:warn]
      message "System boot detected (#{uptime_sec} seconds up), compared using '>'"
      warning
    elsif uptime_sec < config[:warn] && !config[:greater]
      message "System boot detected (#{uptime_sec} seconds up), compared using '<'"
      warning
    end

    message "System booted at #{uptime_date}"
    ok
  end
end
