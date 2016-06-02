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

    def get_items
      @items
    end

    def get_net_payable
      @net_payable
    end

    def get_total_amount
      @total_amount
    end

    # Updates net payable of bill by applying discounts to the bill
    def update_net_payable(percent_discs, fixed_disc)
      max_discount = 0
      percent_discs.each do |percent_disc|
        if percent_disc.is_eligible(self)
          discount = percent_disc.discount_amount(self)
          max_discount = discount unless discount < max_discount
        end
      end
      @net_payable -= max_discount

      # Fixed discount is based on the amount of the bill after
      # percentage based discounts have been taken into account
      if fixed_disc.is_eligible(self)
        discount = fixed_disc.discount_amount(self)
        @net_payable -= discount
      end
    end

  private
    # Updates the amount of bill and sets net payable equal to
    # the total amount
    def update_total_amount
      sum = 0
      @items.each do |item|
        sum += item.get_price
      end
      @total_amount = sum
      @net_payable = @total_amount
    end
end
