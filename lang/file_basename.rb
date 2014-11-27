def split_files(file)
  ext = File.extname file
  name = File.basename file, ext
  puts "name: #{name}, ext: #{ext}"
end

['my_file','my_file.rb','my.file.rb'].each { |f| split_files f }
