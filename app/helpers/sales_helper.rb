require 'pry'

module SalesHelper

def display_employee_name(sale)
  if current_employee == sale.employee
    link_to sale.employee_name, employees_path(@employee)
  else
    sale.employee_name
  end
end

  def display_product_name(sale)
    if current_employee == sale.employee
      link_to sale.product_name, sale_path(sale)
    else
      sale.product.name
    end
  end

end

