# A percentage discount given to purchases made by affiliates of the store
class AffiliateDiscount < PercentageDiscount
  DISCOUNT = 0.1

  def initialize(discount = DISCOUNT)
    super(discount)
  end

  def is_eligible(bill)
    return bill.get_user.get_type == :affiliate ? true : false
  end
end
