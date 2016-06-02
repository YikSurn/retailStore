require_relative '../spec_helper'

describe Bill do
  before :each do
    @customer = Customer.new('John', 'john@doe.com', Date.new(2012,5,1))
    @onion = Item.new('Onion', 5, :groceries)
    @socks = Item.new('Socks', 10, :clothes)
    @item_list = [@onion, @socks]
    @bill = Bill.new(@customer, @item_list)

    @percent_discs = []
    @percent_discs << EmployeeDiscount.new(0.3)
    @percent_discs << AffiliateDiscount.new(0.1)
    @percent_discs << LoyalCustomerDiscount.new(0.05, 2)
    @fixed_disc = FixedAmountDiscount.new
  end

  describe '.initialize' do
    it 'has the right details' do
      expect(@bill.instance_variable_get('@user')).to equal(@customer)
      expect(@bill.instance_variable_get('@items')).to equal(@item_list)
    end
  end

  describe '.update_net_payable' do
    it 'updates net payable' do
      @bill.update_net_payable(@percent_discs, @fixed_disc)
      expect(@bill.get_net_payable).to eq(14.5)
    end

    it 'discounts based on the highest percentage based discount' do
      loyal_affiliate = Affiliate.new('John', 'john@doe.com', Date.new(2012,5,1))
      bill = Bill.new(loyal_affiliate, @item_list)
      bill.update_net_payable(@percent_discs, @fixed_disc)
      expect(bill.get_net_payable).to eq(14)
    end
  end

  describe '.update_total_amount' do
    it 'updates total amount' do
      @bill.send(:update_total_amount)
      expect(@bill.get_total_amount).to eq(15)
    end
  end

end
