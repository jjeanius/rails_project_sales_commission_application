class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:amazon]
  validates_uniqueness_of :email, :name
  has_many :sales
  has_many :products, through: :sales
  attribute :admin

  def self.from_omniauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |employee|
         employee.provider = auth.provider
         employee.uid = auth.uid
         employee.email = auth.info.email
         employee.password = Devise.friendly_token[0,20]
        end
      end
    
 end 
