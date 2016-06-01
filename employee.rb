# A user who is an employee of the store
class Employee < User
  def initialize(name, email, date_joined = Date.today)
    super(name, email, date_joined, :employee)
  end
end
