class Sales < ApplicationRecord
  belongs_to :employee
  belongs_to :product
  accepts_nested_attributes_for :employee, allow_destroy: true
  accepts_nested_attributes_for :product, allow_destroy: true
  validates :employee_name, :product_name, :sales_rate, :quantity, :commission_rate, presence: true, allow_blank: false
 
  def employee_name
    self.try(:employee).try(:name)
  end

  def employee_name=(name)
    employee = Employee.find_or_create_by(name: name)
    self.employee = employee
  end    
   
  
end
