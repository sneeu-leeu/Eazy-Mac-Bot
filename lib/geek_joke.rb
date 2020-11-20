require 'net/http'
require 'json'

class GeekJoke
  attr_reader :values

  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
    @values
  end

  def make_the_request
    url = 'https://api.chucknorris.io/jokes/random'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
