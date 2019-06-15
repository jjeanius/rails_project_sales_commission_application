class CallbacksController < Devise::   #inherit from the devise Omniauth callbacks controllers - so that it has few other features such as handinghandleing fauilers

    
    def amazon
      @employee = Employee.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @employee        
    end

    def all  #find or create an employee matching that hash 
      @employee = Employee.from_omniauth(request.env["omniauth.auth"})
      if @employee.persisted?  
        sign_in_and redirect employee"
        flash noticve "Signed in!"
      else
        session["devise.user_attributes"] = uawe_
        redirect_to new_employee_registration_url

    end
    alias_method :amazon   #use alias method to point anyother provider
       
end
