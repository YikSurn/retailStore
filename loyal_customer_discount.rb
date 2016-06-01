# A percentage discount given to purchases made by customers of the store
# who have been purchasing from the store for at least MIN_DURATION_YEAR years
class LoyalCustomerDiscount < PercentageDiscount
  DISCOUNT = 0.05
  MIN_DURATION_YEAR = 2

  def initialize(discount = DISCOUNT, min_duration_year = MIN_DURATION_YEAR)
    super(discount)
    @min_duration_year = MIN_DURATION_YEAR
  end

  def is_eligible(bill)
    latest_join_date = Date.today.prev_year(@min_duration_year)
    return (bill.get_user.date_joined <= latest_join_date) ? true : false
  end

  def discount_amount(bill)
    return sum_price_non_groceries(bill.get_items) * @discount
  end
end
