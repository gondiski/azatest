module Services
    require 'httparty'
    require 'uri'
    require 'json'
    class Exchange
      include HTTParty.get()
    end
end
