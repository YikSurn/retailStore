# A percentage discount given to purchases made by affiliates of the store
class AffiliateDiscount < PercentageDiscount
  DISCOUNT = 0.1

  def initialize(discount = DISCOUNT)
    super(discount)
  end

  def is_eligible(bill)
    return bill.get_user.type == :affiliate ? true : false
  end

  def discount_amount(bill)
    return sum_price_non_groceries(bill.get_items) * @discount
  end
end
