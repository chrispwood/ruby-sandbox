File.foreach('example_file.txt').each_slice(2) do |lines|
  puts lines
  puts '-----------------------------------'
end
