class Sale < ApplicationRecord
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

  def employee_name=(name)  # setter method - sales in initialize with employee_name
    employee = Employee.find_or_create_by(name: name)
    self.employee = employee
  end

  def total_sales
   @total_sales = quantity * sales_rate
  end

  def total_commission
    @total_commission =(quantity * sales_rate )/10000 * commission_rate

  end

  scope :quantity, -> {order('quantity DESC')}

 end
