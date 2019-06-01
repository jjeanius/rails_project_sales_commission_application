class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email, :name
  has_many :sales
  has_many :products, through: :sales
  attribute :admin
  accepts_nested_attributes_for :sales, allow_destroy: true

end
