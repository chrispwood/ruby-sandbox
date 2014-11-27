def test(ary)
  !!ary && Array(ary).any? {|i| i=='ha'}
end

puts test(nil)
puts test('ha')
puts test(['ha'])
puts test(['h'])
puts test(['hey','ha'])
puts test(['hey','hay'])
