#!/usr/bin/env ruby
require 'json'

my_hash = {objects:[my_field:'value1', 'my_field'=>'value2', 'foo'=>'bar'], blah:'happy'}
puts my_hash
puts my_hash.to_json
