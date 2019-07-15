class Sales < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :product, optional: true
  accepts_nested_attributes_for :employee, allow_destroy: true
  accepts_nested_attributes_for :product, allow_destroy: true
  
  validates :employee_name, presence: true
  validates :product_name, presence: true
  validates :sales_rate, presence: true
  validates :quantity, presence: true
  validates :commission_rate, presence: true
 
  def employee_name
    self.try(:employee).try(:name)
  end

  def employee_name=(name)
    employee = Employee.find_or_create_by(name: name)
    self.employee = employee
  end    
   
  
end
