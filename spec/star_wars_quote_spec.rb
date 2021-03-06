require_relative '../lib/star_wars_quote'

describe StarQuote do
  let(:fact) { StarQuote.new }
  describe '#initialize' do
    let(:values) { fact.values }
    it 'returns false for objects if it is not parsed to array' do
      expect(values.is_a?(Array)).to eql(false)
    end
  end

  context '#make_the_request' do
    it 'returns true for a hash object having two key/value pairs' do
      expect(fact.values.is_a?(Hash)).to eql(true)
    end
  end
end
