# The store which contains all the bills
class Store
  def initialize
    @bills = []
    @percent_discs = []
    @fixed_disc = new FixedAmountDiscount()

    create_percentage_discs
  end

  # Initializes the percentage based discounts
  def create_percentage_discs
    @percent_discs << new EmployeeDiscount()
    @percent_discs << new AffiliateDiscount()
    @percent_discs << new LoyalCustomerDiscount()
  end

  # Creates a bill and updates the net payable of the bill
  def create_bill(user, items)
    bill = new Bill(user, items)
    bill.update_net_payable(@percent_discs, @fixed_disc)
  end

  # Return the net payable amount of a bill
  def get_bill_amount(bill)
    return bill.get_net_payable
  end
end
