# An abstract class for percentage based discounts
class PercentageDiscount < Discount
    def initialize(discount)
      @discount = discount
    end

    def is_eligible
    end

    # Amount eligible to be discounted
    def discount_amount(bill)
      return sum_price_non_groceries(bill.get_items) * @discount
    end

  private
    # Percentage based discounts do not apply to groceries
    def sum_price_non_groceries(items)
      sum = 0
      items.each do |item|
        sum += item.get_price unless item.get_category == :groceries
      end

      return sum
    end
end
