class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:employee).permit(:employee, :name, :region, :position, :email, :password, :password_confirmation, :admin)
  end

  def account_update_params
    params.require(:employee).permit(:employee, :name, :region, :position, :email, :password, :password_confirmation, :admin)
  end

end


