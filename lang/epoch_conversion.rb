#!/usr/bin/env ruby

epochs = '1415733472'
puts Time.at(epochs.to_i).utc.strftime("%Y-%m-%d %H:%M:%S")
