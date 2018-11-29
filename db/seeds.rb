require 'csv'
require_relative '../app/models/comedian'
require_relative '../app/models/special'

file_text = File.read('db/data/Comedians.csv')
file = CSV.parse(file_text, headers: true, header_converters: :symbol)
file.each do |row|
  Comedian.create(name: row[:name], age: row[:age], city: row[:city])
end

file_text = File.read('db/data/Specials.csv')
file = CSV.parse(file_text, headers: true, header_converters: :symbol)
file.each do |row|
  Special.create(title: row[:title], runtime: row[:runtime], image: row[:image], comedian_id: row[:comedian_id])
end
