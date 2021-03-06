require 'net/http'
require 'json'

class Cuteness
  attr_reader :values

  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
    @values
  end

  def make_the_request
    url = 'https://dog.ceo/api/breeds/image/random'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
