require "./employee.rb"
require "./reportable.rb"

module Actualize
  class Manager < Employee
    include Reportable

    def initialize(input_options)
      super(input_options)
      @employees = input_options[:employees]
    end

    def give_all_raises

      @employees.each do |employee|
        employee.give_annual_raise
        p employee
      end
    end

    def fire_all_employees

      @employees.each do |employee|
        employee.active = false
        p employee
      end
    end
  end
end