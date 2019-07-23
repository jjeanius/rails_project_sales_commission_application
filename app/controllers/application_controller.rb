class ApplicationController < ActionController::Base
   before_action :authenticate_employee!
  # protect_from_forgery :exception
  protect_from_forgery with: :null_session  # This is the method that defines the application behavior when a request is found to be unverified.
# By default, \Rails resets the session when it finds an unverified request.


def handle_unverified_request
  reset_session
end

end

