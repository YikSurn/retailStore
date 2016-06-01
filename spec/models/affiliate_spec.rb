require_relative '../spec_helper'

describe Affiliate do
  before :each do
      @affiliate = Affiliate.new 'John', 'john@doe.com', Date.new(2015,5,1)
  end

  describe '.initialize' do
    it 'creates an Affiliate object' do
      expect(@affiliate).to be_instance_of(Affiliate)
    end

    it 'creates an Affiliate object with the right details' do
      expect(@affiliate.instance_variable_get('@name')).to eq('John')
      expect(@affiliate.instance_variable_get('@email')).to eq('john@doe.com')
      expect(@affiliate.instance_variable_get('@date_joined')).to eq(Date.new(2015,5,1))
      expect(@affiliate.instance_variable_get('@type')).to eq(:affiliate)
    end
  end
end
