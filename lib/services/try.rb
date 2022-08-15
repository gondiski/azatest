require 'net/http'
require 'json'

puts "Enter the input currency:"
input_currency = gets.chomp
puts "Enter the output currency:"
output_currency = gets.chomp
puts "Enter the amount:"
input_amount = gets.chomp
# Setting URL
# url = "https://v6.exchangerate-api.com/v6/#{ENV['API_KEY']}/pair/#{input_currency}/#{output_currency}/#{input_amount}"
url = "https://v6.exchangerate-api.com/v6/8017880d47879f56d184a0c0/pair/#{input_currency}/#{output_currency}/#{input_amount}"
uri = URI(url)
response = Net::HTTP.get(uri)
response_obj = JSON.parse(response)

# Getting a rate
rate = response_obj
puts "This is the #{rate['conversion_result']}"