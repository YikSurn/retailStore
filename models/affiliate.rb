# A user who is an affiliate of the store
class Affiliate < User
  def initialize(name, email, date_joined = Date.today)
    super(name, email, date_joined, :affiliate)
  end
end
