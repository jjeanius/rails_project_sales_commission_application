class Product < ApplicationRecord
  has_many :sales
  has_many :employees, through: :sales
  validates :name, uniqueness: true, allow_blank: false  
  validates  :description, presence: true, allow_blank: false
  
end
