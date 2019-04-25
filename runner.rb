require "./employee.rb"
require "./manager.rb"
require "./intern.rb"

employee_1 = Actualize::Employee.new(
                          first_name: "Helen", 
                          last_name: "Bonom Carter", 
                          salary: 80000, 
                          active: true
                          )

employee_2 = Actualize::Employee.new(
                          first_name: "Peter", 
                          last_name: "Gibbons", 
                          salary: 60000, 
                          active: true
                          )

manager = Actualize::Manager.new(
                      first_name: "Leslie",
                      last_name: "Knope",
                      salary: 100000,
                      active: true,
                      employees: [employee_1, employee_2]
                      )

intern = Actualize::Intern.new(
                    first_name: "Jimmy",
                    last_name: "Olsen",
                    salary: 30000,
                    active: true
                    )

employee_1.print_info
employee_2.print_info
manager.print_info
intern.print_info
intern.send_report