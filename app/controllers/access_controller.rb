class AccessController < ApplicationController
  
	before_action :connected_user, :except =>[:login,:tentative_log,:logout]

  def index
  	#display text and links 
  end

  def login
  	#login form 
  end

  def tentative_log

	if params[:name].present?&& params[:password].present?
		user=ArtriverUser.where(:name => params[:name]).first
	end
	if user
		authorized_user =user.authenticate(params[:password])
	end
	if authorized_user 

		#on crée des variables de session pour conserver user id et name
		session[:user_name] = authorized_user.name
		session[:user_id] = authorized_user.id

		#ajouter la notif
		redirect_to(:action=>'admin')
	else 
		#ajouter la notif
		redirect_to(:action=>'login')
	end




  end

  def logout
  	
  	#on réinitilise les variables de sesion

	session[:user_name] = nil
	session[:user_id] = nil
  	
  	#ajouter la notif 

  	redirect_to(:action=>'login')
  	
  end



end
