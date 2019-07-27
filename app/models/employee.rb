class Employee < ApplicationRecord
  validates_uniqueness_of :email, presence: true
  validates_uniqueness_of :name,  presence: true
  #validates :region, presence: true
  #validates :position, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:amazon]   # add omniauthable 
  
  has_many :sales
  has_many :products, through: :sales

  attribute :admin

  def self.from_omniauth(auth)  # take an argument from auth, data we are recvg from callbacks
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |employee|   #find the employee record by uid and call the first record or create a new employee by passing a employee block
      employee.provider = auth.provider
      employee.uid = auth.uid   
      employee.email = auth.info.email     
      employee.password = Devise.friendly_token[0,20]
     # binding.pry
  end
end
 
def alpha
  order(:region)
end 


 scope :region, -> {where('region="Florida"')}

 

end