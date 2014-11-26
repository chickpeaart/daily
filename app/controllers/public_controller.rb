class PublicController < ApplicationController
  def index
  	render :template => 'artworks/index'
  end

  def show
  end
end
