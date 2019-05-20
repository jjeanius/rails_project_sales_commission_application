class Sales < ApplicationRecord
  belongs_to :employee
  belongs_to :product
  accepts_nested_attributes_for :employee, allow_destroy: true
  accepts_nested_attributes_for :product, allow_destroy: true
  

   
  def calculate_sales
    @total_sales = quantity * sales_rate 
  end

  def calculate_commission
    @total_commission = quantity * sales_rate * commission_rate/100
  end

end
