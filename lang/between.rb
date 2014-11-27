#!/usr/bin/env ruby
vars = [-1,0,30,100,101]

vars.each {|v| puts "#{v}.between?(0,100) => #{v.between?(0,100)}" }

