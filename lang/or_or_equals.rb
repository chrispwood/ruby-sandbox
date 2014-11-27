MyConst = false
OtherConst = 'constant set'
MyConst ||= OtherConst
puts "myconst: #{MyConst}"

MyConst2 = false
OtherConst2 = 'constant set'
MyConst2 = OtherConst2 unless Object.const_defined?(:MyConst2)
puts "myconst2: #{MyConst2}"
