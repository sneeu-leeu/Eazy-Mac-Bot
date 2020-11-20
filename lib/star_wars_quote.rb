require 'net/http'
require 'json'

class StarQuote
  attr_reader :values
  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
    @values
  end

  def make_the_request
    url = 'http://swquotesapi.digitaljedi.dk/api/SWQuote/RandomStarWarsQuote'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end