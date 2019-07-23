class WelcomeController < ApplicationController
  
  def home
    if current_employee.region.nil?
      render 'welcome/account_profile'
    else
      render :home
   end

  end
end


