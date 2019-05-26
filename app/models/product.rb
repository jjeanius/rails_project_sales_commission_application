class Product < ApplicationRecord
  has_many :sales
  has_many :employees, through: :sales
  validates :name, uniqueness: true 

  
end
