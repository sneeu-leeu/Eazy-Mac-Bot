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
    url = 'https://geek-jokes.sameerkumar.website/api'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end