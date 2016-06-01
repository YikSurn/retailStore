# A bill charged to a user for the items bought from the store
class Bill
  def initialize(user, items)
    @user = user
    @items = items
    @net_payable = 0
    @total_amount = 0

    update_total_amount
  end

  def get_user
    @user
  end

  def get_net_payable
    @net_payable
  end

  # Updates the amount of bill and sets net payable equal to
  # the total amount
  def update_total_amount
    @items.each do |item|
      @total_amount += item.price
    end

    @net_payable = @total_amount
  end

  # Updates net payable of bill by applying discounts to the bill
  def update_net_payable(percent_discs, fixed_disc)
    max_discount = 0
    percent_discs.each do |percent_disc|
      if percent_disc.is_eligible(this)
        discount = percent_disc.discount_amount(this)
        max_discount = discount unless discount < max_discount
      end
    end
    @net_payable -= max_discount

    # Fixed discount is based on the amount of the bill after
    # percentage based discounts have been taken into account
    if fixed_disc.is_eligible(this)
      discount = @fixed_disc.discount_amount(this)
      @net_payable -= discount
    end
  end
end
