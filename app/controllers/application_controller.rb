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


def already_voted

    @user_voted=ArtriverUser.find(session[:user_id])
    
=begin
    unless @user_voted.voted == false
      flash[:voted]='Vous avez déja voté'
      redirect_to(:controller => 'public',:action=>'show')
      return false
  	else
  		return true
  	end
  
=end
    
    if @user_voted.voted == true
      flash[:voted]='Vous avez déja voté'
      redirect_to(:controller => 'public',:action=>'show')
      return true
    else
      return false
    end




    end


    




end
