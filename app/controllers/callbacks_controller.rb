class CallbacksController < Devise::OmniauthCallbacksController   #inherit from the devise Omniauth callbacks controllers 
   
  def amazon  #find or create an employee matching that hash 
    @employee = Employee.from_omniauth(request.env["omniauth.auth"])
       sign_in_and_redirect @employee
        flash.notice = "Signed in!"
   
  end
end
