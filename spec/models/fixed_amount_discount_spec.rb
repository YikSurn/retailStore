require_relative '../spec_helper'

describe FixedAmountDiscount do
  before :each do
    @fixed_disc = FixedAmountDiscount.new(5, 100)

    @onion = Item.new('Onion', 5, :groceries)
    @socks = Item.new('Socks', 10, :clothes)
    @shampoo = Item.new('Shampoo', 100, :personal_care)
    @watch = Item.new('Watch', 300, :fashion_accessories)
  end

  describe '.initialize' do
    it 'has the right details' do
      expect(@fixed_disc.instance_variable_get('@dollar_discount')).to equal(5)
      expect(@fixed_disc.instance_variable_get('@amount_multiple')).to equal(100)
    end
  end

  describe '.is_eligible' do
    it 'returns true when bill meets the minimum amount' do
      item_list = [@shampoo]
      bill = Bill.new(nil, item_list)
      expect(@fixed_disc.is_eligible(bill)).to be(true)
    end

    it 'returns false when bill is less than minimum amount' do
      item_list = [@onion, @socks]
      bill = Bill.new(nil, item_list)
      expect(@fixed_disc.is_eligible(bill)).to be(false)
    end
  end

  describe '.discount_amount' do
    it 'returns correct discount amount' do
      item_list = [@onion, @socks, @shampoo, @watch]
      bill = Bill.new(nil, item_list)
      expect(@fixed_disc.discount_amount(bill)).to eq(20)
    end

    it 'returns discount amount after the percentage based discounts' do
      perc_disc = EmployeeDiscount.new(0.3)
      employee = Employee.new('John', 'john@doe.com', Date.new(2015,5,1))
      item_list = [@onion, @socks, @shampoo, @watch]
      bill = Bill.new(employee, item_list)

      total_amount = bill.get_total_amount
      bill.instance_variable_set('@net_payable', total_amount - perc_disc.discount_amount(bill))
      expect(@fixed_disc.discount_amount(bill)).to eq(10)
    end
  end
end
