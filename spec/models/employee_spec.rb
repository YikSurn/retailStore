require_relative '../spec_helper'

describe Employee do
  before :each do
      @employee = Employee.new 'John', 'john@doe.com', Date.new(2015,5,1)
  end

  describe '.initialize' do
    it 'creates an employee object' do
      expect(@employee).to be_instance_of(Employee)
    end

    it 'creates an employee object with the right details' do
      expect(@employee.instance_variable_get('@name')).to eq('John')
      expect(@employee.instance_variable_get('@email')).to eq('john@doe.com')
      expect(@employee.instance_variable_get('@date_joined')).to eq(Date.new(2015,5,1))
      expect(@employee.instance_variable_get('@type')).to eq(:employee)
    end
  end
end
