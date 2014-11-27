#!/usr/bin/env ruby

TIMESTAMPS = ['date', 'time', 'timestamp', 'datetime']
DOMAINS = ['domain', 'domainname', 'host', 'hostname', 'fqdn']

time = ->(v) { TIMESTAMPS.include? v }
domain = ->(v) { DOMAINS.include? v }

def time2
  ->(v) { TIMESTAMPS.include? v }
end

my_v = 'time'

case my_v
when time2
  puts "timestamp2"
when time
  puts "timestamp"
when domain
  puts "domain"
else
  puts "other"
end
