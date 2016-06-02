require_relative '../spec_helper'

describe Store do
  before :each do
    @store = Store.new

    @customer = Customer.new('John', 'john@doe.com', Date.new(2012,5,1))

    @onion = Item.new('Onion', 5, :groceries)
    @socks = Item.new('Socks', 10, :clothes)
    @shampoo = Item.new('Shampoo', 100, :personal_care)
    @watch = Item.new('Watch', 300, :fashion_accessories)
    @item_list = [@onion, @socks, @shampoo, @watch]
  end

  describe '.create_percentage_discs' do
    it 'creates all the percentage based discounts' do
      expect(@store.get_percent_discs.length).to eq(3)
    end
  end

  describe '.generate_sale' do
    it 'returns the correct price charged to user' do
      cost = @store.generate_sale(@customer, @item_list)
      expect(cost).to eq(379.5)
    end
  end

  describe '.create_bill' do
    it 'creates a bill' do
      bill = @store.create_bill(@customer, @item_list)
      expect(bill).to be_an_instance_of(Bill)
    end

    it 'calculates the correct net payable amount' do
      bill = @store.create_bill(@customer, @item_list)
      expect(bill.get_net_payable).to eq(379.5)
    end
  end

  describe '.get_bill_amount' do
    it 'returns the net payable amount of a bill' do
      bill = @store.create_bill(@customer, @item_list)
      net_payable = @store.get_bill_amount(bill)
      expect(net_payable).to eq(379.5)
    end
  end
end
