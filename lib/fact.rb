require 'net/http'
require 'json'

class Fact
  attr_reader :values

  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
    @values
  end

  def make_the_request
    url = 'https://uselessfacts.jsph.pl/random.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
