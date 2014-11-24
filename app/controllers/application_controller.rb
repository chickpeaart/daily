class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def connected_user
	unless session[:user_name].present?
		 redirect_to(:controller =>'access',:action=>'login')
		 return false
		 else 
			return true
	end
	
end




end
