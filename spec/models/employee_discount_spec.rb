require_relative '../spec_helper'

describe EmployeeDiscount do
  before :each do
    @perc_disc = EmployeeDiscount.new(0.3)

    @affiliate = Affiliate.new('John', 'john@doe.com', Date.new(2015,5,1))
    @customer = Customer.new('John', 'john@doe.com', Date.new(2015,5,1))
    @employee = Employee.new('John', 'john@doe.com', Date.new(2015,5,1))
  end

  describe '.is_eligible' do
    it 'returns true when user is an employee' do
      bill = Bill.new(@employee, [])
      expect(@perc_disc.is_eligible(bill)).to be(true)
    end

    it 'returns false when user is an affiliate' do
      bill = Bill.new(@affiliate, [])
      expect(@perc_disc.is_eligible(bill)).to be(false)
    end

    it 'returns false when user is an customer' do
      bill = Bill.new(@customer, [])
      expect(@perc_disc.is_eligible(bill)).to be(false)
    end
  end
end
