# The store which contains all the bills
class Store
    def initialize
      @bills = []
      @percent_discs = []
      @fixed_disc = FixedAmountDiscount.new

      create_percentage_discs
    end

    def get_percent_discs
      @percent_discs
    end

    # Creates a sale with the items purchased by user
    # and returns amount to be paid
    def generate_sale(user, items)
      bill = create_bill(user, items)

      return get_bill_amount(bill)
    end

    # Creates a bill and updates the net payable of the bill
    def create_bill(user, items)
      bill = Bill.new(user, items)
      bill.update_net_payable(@percent_discs, @fixed_disc)
      @bills << bill

      return bill
    end

    # Return the net payable amount of a bill
    def get_bill_amount(bill)
      return bill.get_net_payable
    end

  private
    # Initializes the percentage based discounts
    def create_percentage_discs
      discs = []
      discs << EmployeeDiscount.new
      discs << AffiliateDiscount.new
      discs << LoyalCustomerDiscount.new

      @percent_discs = discs
    end
end
