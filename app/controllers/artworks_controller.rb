class ArtworksController < ApplicationController
  before_action :connected_user, :except =>[:login,:tentative_log,:logout]

  def index
    @artwork = Artwork.order("name")
    
      
      
  end


  

  def show
    @artwork= Artwork.find(params[:id])

  end

  def new
    @artwork = Artwork.new
  end
  

  def edit
    @artwork=Artwork.find(params[:id])


  end

  def update

      @artwork=Artwork.find(params[:id])
    
        if @artwork.update_attributes(params.require(:artwork).permit(:name))
          redirect_to(:action=>'index')
          flash[:notice] ='enregistré'

          else
          render ('edit')
        end
  end

  def delete
  @artwork=Artwork.find(params[:id])



  end

  def destroy
    @artwork=Artwork.find(params[:id])

    if @artwork.destroy
      flash[:notice] ="détruit"
    redirect_to(:action=>"index")
    else 
    render('delete')    
    end

    
  end
  

  def create


      @artwork = Artwork.new(params.require(:artwork).permit(:name))
    
        if @artwork.save
        redirect_to(:action=>'index')
        flash[:notice] ='crée'

        else
        render ('new')
      end
    end
  end