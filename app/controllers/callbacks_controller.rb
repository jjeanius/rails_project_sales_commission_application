class CallbacksController < Devise::OmniauthCallbacksController  
   
  def amazon  #find or create an employee matching that hash 
    @employee = Employee.from_omniauth(request.env["omniauth.auth"])   
      sign_in_and_redirect @employee   # sign_in_and_redirect - a Devise method
    flash.notice = "Signed in!"          
  end
end
