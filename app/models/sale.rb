class Sale < ApplicationRecord
  belongs_to :employee
  belongs_to :product
  accepts_nested_attributes_for :employee, allow_destroy: true
  
end
