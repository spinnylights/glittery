#!/user/bin/env ruby

print "Username: "
username = gets.chomp
print "Password: "
password = gets.chomp

File.open("config/admin.yml", "w") do |file|
  file.puts "---"
  file.puts "!ruby/sym username: #{username}"
  file.puts "!ruby/sym password: #{password}"
end
