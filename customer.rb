# A user who is only a customer of the store
class Customer < User
  def initialize(name, email, date_joined = Date.today)
    super(name, email, date_joined)
  end
end
