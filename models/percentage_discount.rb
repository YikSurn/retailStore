# An abstract class for percentage based discounts
class PercentageDiscount < Discount
  def initialize(discount)
    @discount = discount
  end

  def is_eligible
  end

  def discount_amount
  end

  # Percentage based discounts do not apply to groceries
  def sum_price_non_groceries(items)
    sum = 0
    items.each do |item|
      sum += item.price unless item.category == :groceries
    end

    return sum
  end
end
