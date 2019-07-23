class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 # has_secure_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:amazon]  #adding omniauthable 
  
  validates_uniqueness_of :email, presence: true, allow_blank: false
  #validates_uniqueness_of :name,  presence: true, allow_blank: false
  # validates :region, presence: true, allow_blank: false
  # validates :password, presence: true, allow_blank: false
  # validates :password_confirmation, presence: true, allow_blank: false
 # validates :position, presence: true, allow_blank: false

  has_many :sales
  has_many :products, through: :sales
 # accepts_nested_attributes_for :sales, allow_destroy: true, reject_if: proc {|att| att['name'].blank? }
  attribute :admin


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |employee|   #find the employee record by uid and call the first record or initalize the new employee and using tap by passing a employee block
         employee.provider = auth.provider
         employee.uid = auth.uid   
         employee.name = auth.info.name      
         # employee.name = auth.info.auth.info.region
         # employee.region = auth.region
         # employee.position = auth.position         
         employee.email = auth.info.email
        
         employee.password = Devise.friendly_token[0,20]
         #binding.pry
        end
        
      end
    # find or create an employee with uid, giving provider that match the omniauth hatch
    # if one is not find, we will create a new employee with these giving attribute by amazon


     

    end