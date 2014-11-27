#!/usr/bin/env ruby

ary1 = [1,2,3]
ary2 = [4,5]
ary1.push *ary2
puts ary1

ary1 = [1,2,3]
ary2 = nil
ary1.push *ary2
puts ary1
