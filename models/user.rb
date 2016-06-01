# The user abstract class
class User
  def initialize(name, email, date_joined = Date.today, type = :customer)
    @name = name
    @email = email
    @date_joined = date_joined
    @type = type
  end
end
