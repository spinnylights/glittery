#!/user/bin/env ruby
require 'rainbow'

def auth_loop(attribute,length_minimum)
  attr_hash = Hash.new
  attr_hash[attribute] = ""

  while true
    print "#{attr_hash.keys.first.to_s.capitalize}: "
    attr_hash[attribute] = gets.chomp
    if attr_hash[attribute].size < length_minimum
      puts ">> #{attr_hash[attribute].capitalize} must be at \
least #{length_minimum} characters".bright
    else
      break
    end
  end
  attr_hash
end

attributes = Hash.new
attributes.merge!(auth_loop(:username, 6))
attributes.merge!(auth_loop(:password, 8))

File.open("config/admin.yml", "w") do |file|
  file.puts "---"
  attributes.each do |key, value|
    file.puts "!ruby/sym #{key}: #{value}"
  end
end
