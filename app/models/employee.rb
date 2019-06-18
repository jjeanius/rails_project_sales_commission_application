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
       where(auth.slice(:provider, :uid)).find do |employee|  #find the employee record by uid and call the first record or initalize the new employee and using tap by passing a employee block
         employee.provider = auth.provider
         employee.uid = auth.uid
         employee.name = auth.name
         employee.region = auth.region
         employee.position = auth.position         
         employee.email = auth.info.email
         employee.password = Devise.friendly_token[0,20]
         
         employee.save!
         # find or create an employee with uid, giving provider that match the omniauth hatch
         # if one is not find, we will create a new employee with these giving attribute by amazon
        end
       #   session[:employee_id] = @employee.id
       #     redirect_to 'employees/index'
      end

      def auth
        request.env['omniauth.auth']
      end

      def self.new_with_session(params, session)
        if session["devise.employee_attributes"]
          new(session["devise.employee_attributes"])
          employee.attributes = params
          employee.valid?
          end
        end






           
    end 
    
