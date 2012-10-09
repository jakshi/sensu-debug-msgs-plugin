#!/usr/bin/env ruby
#
# Debug plugin
# ===
#
# This plugin generate critical or ok messages
# depending on debug.msg content
# if there's an 'ok' in the file then it generate ok message
# if there's an 'critical' in the file then it generate critical
#message

require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-plugin/check/cli'

class DebugMsgs < Sensu::Plugin::Check::CLI
  def run
    msg = ""
    File.open("/etc/sensu/debug.msg") do |msg_file|
      msg = msg_file.read
    end
    ok "Don't worry, Be happy!" if /^ok.*/ =~ msg
    critical "Alarm! We have a situation here!" if /^critical.*/ =~ msg
    warning "Something worring me..." if /^warning.*/ =~ msg
  end
end
