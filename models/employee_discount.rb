# A percentage discount given to purchases made by employees of the store
class EmployeeDiscount < PercentageDiscount
  DISCOUNT = 0.3

  def initialize(discount = DISCOUNT)
    super(discount)
  end

  def is_eligible(bill)
    return bill.get_user.type == :employee ? true : false
  end

  def discount_amount(bill)
    return sum_price_non_groceries(bill.get_items) * @discount
  end
end
