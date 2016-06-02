require_relative '../spec_helper'

describe PercentageDiscount do
  before :each do
    @perc_disc = PercentageDiscount.new(0.3)

    @onion = Item.new('Onion', 5, :groceries)
    @socks = Item.new('Socks', 10, :clothes)
    @shampoo = Item.new('Shampoo', 100, :personal_care)
    @watch = Item.new('Watch', 300, :fashion_accessories)
  end

  describe '.initialize' do
    it 'has the right details' do
      expect(@perc_disc.instance_variable_get('@discount')).to eq(0.3)
    end
  end

  describe '.sum_price_non_groceries' do
    it 'returns the total price of non-groceries' do
      item_list = [@onion, @socks, @shampoo, @watch]
      sum = @perc_disc.send(:sum_price_non_groceries, item_list)
      expect(sum).to eq(410)
    end
  end

  describe '.discount_amount' do
    it 'returns discount amount' do
      item_list = [@socks, @shampoo, @watch]
      bill = Bill.new(nil, item_list)
      expect(@perc_disc.discount_amount(bill)).to eq(123)
    end

    it 'returns discount amount excluding groceries' do
      item_list = [@onion, @socks, @shampoo, @watch]
      bill = Bill.new(nil, item_list)
      expect(@perc_disc.discount_amount(bill)).to eq(123)
    end

    it 'returns 0 when all items are groceries' do
      item_list = [@onion]
      bill = Bill.new(nil, item_list)
      expect(@perc_disc.discount_amount(bill)).to eq(0)
    end
  end
end
