require_relative '../spec_helper'

describe Customer do
  before :each do
    @customer = Customer.new('John', 'john@doe.com', Date.new(2015,5,1))
  end

  describe '.initialize' do
    it 'creates a customer object' do
      expect(@customer).to be_instance_of(Customer)
    end

    it 'has the right details' do
      expect(@customer.instance_variable_get('@name')).to eq('John')
      expect(@customer.instance_variable_get('@email')).to eq('john@doe.com')
      expect(@customer.instance_variable_get('@date_joined')).to eq(Date.new(2015,5,1))
      expect(@customer.instance_variable_get('@type')).to eq(:customer)
    end
  end
end
