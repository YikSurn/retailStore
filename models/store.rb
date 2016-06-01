# The store which contains all the bills
class Store
  def initialize
    @bills = []
    @percent_discs = []
    @fixed_disc = FixedAmountDiscount.new

    create_percentage_discs
  end

  # Initializes the percentage based discounts
  def create_percentage_discs
    @percent_discs << EmployeeDiscount.new
    @percent_discs << AffiliateDiscount.new
    @percent_discs << LoyalCustomerDiscount.new
  end

  # Creates a bill and updates the net payable of the bill
  def create_bill(user, items)
    bill = Bill.new(user, items)
    bill.update_net_payable(@percent_discs, @fixed_disc)
  end

  # Return the net payable amount of a bill
  def get_bill_amount(bill)
    return bill.get_net_payable
  end
end
