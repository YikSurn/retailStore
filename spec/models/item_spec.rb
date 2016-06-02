require_relative '../spec_helper'

describe Affiliate do
  before :each do
    @item = Item.new('Onion', 5, :groceries)
  end

  describe '.initialize' do
    it 'creates an Item object' do
      expect(@item).to be_instance_of(Item)
    end

    it 'has the right details' do
      expect(@item.instance_variable_get('@name')).to eq('Onion')
      expect(@item.instance_variable_get('@price')).to eq(5)
      expect(@item.instance_variable_get('@category')).to eq(:groceries)
    end
  end
end
