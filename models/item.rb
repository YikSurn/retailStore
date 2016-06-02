# An item of the store
class Item
  def initialize(name, price, category)
    @name = name
    @price = price
    @category = category
  end

  def get_category
    @category
  end

  def get_price
    @price
  end
end
