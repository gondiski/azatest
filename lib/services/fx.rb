module Services
  require 'net/http'
  require 'json'
  
  class Exchange
    def convert(input_currency,output_currency,input_amount)
      # Setting URL
      url = "https://v6.exchangerate-api.com/v6/#{ENV['API_KEY']}/pair/#{input_currency}/#{output_currency}/#{input_amount}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      response_obj = JSON.parse(response)
      
      # Getting a rate
      rate = response_obj['conversion_rates']['EUR']
    end
  end
end
