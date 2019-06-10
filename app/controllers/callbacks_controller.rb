class CallbacksController < ApplicationController
    def amazon
        @employee = Employee.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @employee
    end

end
