require 'pry'

module SalesHelper

 # def employee_id_field(sales)
 #   if sales.employee.nil?
  #    select_tag "sales[employee_id", options_from_collection_for_select(Employee.all, :id, :name)
  #  else
  #    hidden_field_tag "sales[employee_id", sales.employee_id
  #  end
 # end

 def calculate_sales
  @total_sales = quantity * sales_rate 
end

def calculate_commission
@total_commission = quantity * sales_rate * commission_rate/100
end


end

