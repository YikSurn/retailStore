require_relative '../spec_helper'

describe LoyalCustomerDiscount do
  before :each do
    @perc_disc = LoyalCustomerDiscount.new(0.05, 2)

    @loyal_customer = Customer.new('John', 'john@doe.com', Date.today.prev_year(2))
    @new_customer = Affiliate.new('John', 'john@doe.com', Date.today.prev_year(1))
  end

  describe '.is_eligible' do
    it 'returns true when user has been a customer for over two years' do
      bill = Bill.new(@loyal_customer, [])
      expect(@perc_disc.is_eligible(bill)).to be(true)
    end

    it 'returns false when user has been a customer for less than two years' do
      bill = Bill.new(@new_customer, [])
      expect(@perc_disc.is_eligible(bill)).to be(false)
    end
  end
end
