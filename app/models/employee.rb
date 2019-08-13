class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:amazon]   # add omniauthable

  validates_uniqueness_of :email, presence: true
  validates_uniqueness_of :name,  presence: true
  validates :region, :presence => true, :on => :update
  validates :position, :presence => true, :on =>:update

  has_many :sales
  has_many :products, through: :sales

  # attribute :admin  (for admin only)

  def self.from_omniauth(auth)  #find or create an employee matching that hash
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |employee|           #find the employee record by uid and call the first record or create a new employee by passing a employee block
      employee.provider = auth.provider
      employee.uid = auth.uid
      employee.email = auth.info.email
      employee.password = Devise.friendly_token[0,20]
  end
end


scope :region, -> {where('region="New York"')}

end