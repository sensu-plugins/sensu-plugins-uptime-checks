#! /usr/bin/env ruby
#  encoding: UTF-8
#
#   metrics-uptime
#
# DESCRIPTION:
#   provide uptime metric
#
# OUTPUT:
#   metric data
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: socket
#
# USAGE:
#
# NOTES:
#
# LICENSE:
# Released under the same terms as Sensu (the MIT license); see LICENSE
# for details.

require 'sensu-plugin/metric/cli'
require 'socket'

#
# Metric Uptime
#
class Uptime < Sensu::Plugin::Metric::CLI::Graphite
  option :scheme,
         description: 'Metric naming scheme, text to prepend to metric',
         short: '-s SCHEME',
         long: '--scheme SCHEME',
         default: "#{Socket.gethostname}.uptime"

  # Main function
  def run
    lines = File.readlines('/proc/uptime', 'r')
    metrics = %w(uptime idletime)
    stats = lines[0].strip.split(/\s+/)

    metrics.size.times { |i| output "#{config[:scheme]}.#{metrics[i]}", stats[i] }

    ok
  end
end
