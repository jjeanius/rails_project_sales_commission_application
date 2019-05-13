class Sale < ApplicationRecord
  belongs_to :employee
  belongs_to :product
  accepts_nested_attributes_for :employee, allow_destroy: true
  accepts_nested_attributes_for :product, allow_destroy: true

  def calculate_commission
    if commission_amount.present? && commission_rate.present?
      self.total_commission = commission_amount * commission_rate
    end
  end
    
    
  def calculate_sales
    if sales_rate.present? && quantity.present?
      self.sales_amount = sales_rate * quantity
      end
  end


end
