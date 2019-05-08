class Product < ApplicationRecord
  has_many :employees
  has_many :employees, through: :commission
end
