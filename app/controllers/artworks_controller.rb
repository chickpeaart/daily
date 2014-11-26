class ArtworksController < ApplicationController
  before_action :connected_user, :except =>[:login,:tentative_log,:logout]
  before_action :list_artworks

    def index
    
          #@artwork = Artwork.order("name")

          @artwork=@subject.artworks.order("name") 

      
    end


  

  def show
    @artwork= Artwork.find(params[:id])

  end

  def new
    @artwork = Artwork.new({:subject_id => @subject.id})
  end
  

  def edit
    @artwork=Artwork.find(params[:id])


  end

  def update

      @artwork=Artwork.find(params[:id])
    
        if @artwork.update_attributes(params.require(:artwork).permit(:name,:subject_id))
          redirect_to(:action=>'index',:subject_id => @subject.id)
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
    redirect_to(:action=>"index",:subject_id => @subject.id)
    else 
    render('delete')    
    end

    
  end
  

  def create


      @artwork = Artwork.new(params.require(:artwork).permit(:name,:subject_id))
    
        if @artwork.save
        redirect_to(:action=>'index',:subject_id => @subject.id)
        flash[:notice] ='crée'

        else
        render ('new')
      end
    end

    private
    def list_artworks
      if params[:subject_id]
        @subject= Subject.find(params[:subject_id])
      end
      
    end




  end