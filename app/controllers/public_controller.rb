class PublicController < ApplicationController
  

  def index
  	#render :template => 'artworks/index'
  end

  def show
  	@artwork = Artwork.order("position DESC")
  	


  end
end
