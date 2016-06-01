# A fixed amount discounted for every specified amount on the bill
#
# e.g. for every $100 (AMOUNT_MULTIPLE) on the bill,
# the customer receives $5 (DOLLAR_DISCOUNT) discount
class FixedAmountDiscount < Discount
  DOLLAR_DISCOUNT = 5
  AMOUNT_MULTIPLE = 100

  def initialize(dollar_discount = DOLLAR_DISCOUNT, amount_multiple = AMOUNT_MULTIPLE)
    @dollar_discount = DOLLAR_DISCOUNT
    @amount_multiple = AMOUNT_MULTIPLE
  end

  def is_eligible(bill)
    return (bill.get_net_payable >= @amount_multiple) ? true : false
  end

  def discount_amount(bill)
    return (bill.get_net_payable.to_i / @amount_multiple) * @dollar_discount
  end
end
