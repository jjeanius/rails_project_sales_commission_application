class Sales < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :product, optional: true
  accepts_nested_attributes_for :employee, allow_destroy: true
  accepts_nested_attributes_for :product, allow_destroy: true
  
  validates :employee_name, presence: true, allow_blank: false
  validates :product_name, presence: true, allow_blank: false
  validates :sales_rate, presence: true, allow_blank: false
  validates :quantity, presence: true, allow_blank: false
  validates :commission_rate, presence: true, allow_blank: false
 
  def employee_name
    self.try(:employee).try(:name)
  end

  def employee_name=(name)
    employee = Employee.find_or_create_by(name: name)
    self.employee = employee
  end    
   
  
end
