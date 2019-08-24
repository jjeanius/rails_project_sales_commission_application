module EmployeesHelper

  def disaplay_employee_name(employee)
    if current_employee == employee
        link_to employee.name, employee_path(employee)
    else
        employee.name
    end
  end

end
