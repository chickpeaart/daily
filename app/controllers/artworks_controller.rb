class ArtworksController < ApplicationController
  before_action :connected_user, :except =>[:login,:tentative_log,:logout]
  before_action :list_artworks
  before_action :my_artwork
  before_action :already_voted

    def index
    
          #@artwork = Artwork.order("name")
          if session[:user_admin] == true
          @artwork=@subject.artworks.order("position") 
        else
              if @user.artworks.first.nil?
                redirect_to(:action=>'new')
              else  
              redirect_to(:action=>'edit', :id => @user.artworks.first.id)
              end    

          
          


          end
        
      
    end


  

  def show
    @artwork= Artwork.find(params[:id])


  end

  def new
    @subject=Subject.first
    @artwork = Artwork.new({:subject_id => @subject.id,:artriver_user_id => @user.id})
   
  end
  

  def edit

    
    @artwork=Artwork.find(params[:id])
    @subject=Subject.first
    
  end

  def update

      @artwork=Artwork.find(params[:id])
    
        if @artwork.update_attributes(params.require(:artwork).permit(:name,:subject_id,:image,:artriver_user_id))
          redirect_to({:controller => 'access', :action=>'index_user'},:subject_id => @subject.id)
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


      @artwork = Artwork.new(params.require(:artwork).permit(:name,:subject_id,:artriver_user_id,:image))
    
        if @artwork.save
        redirect_to({:controller => 'access', :action=>'index_user'},:subject_id => @subject.id,:artriver_user_id => @user.id)
        flash[:notice] ='crée'

        else
        render ('new')
      end
    end


  def vote_up
    @curent_user=ArtriverUser.find(session[:user_id])
    @curent_user.voted = true
      @users_work=Artwork.find(params[:id])

      @users_work.position += 1


      @curent_user.save
      @users_work.save
      redirect_to(:controller => 'public' ,:action=>'show')

      
  end
  def vote_down
    @curent_user=ArtriverUser.find(session[:user_id])
    @curent_user.voted = true

    @users_work=Artwork.find(params[:id])

      @users_work.position -= 1
      @curent_user.save
      @users_work.save
      redirect_to(:controller => 'public' ,:action=>'show')
      
  end

    private
    def list_artworks
      if params[:subject_id]
        @subject= Subject.find(params[:subject_id])
      end
      
    end

    private
    def my_artwork
      #if params[:artriver_user_id]
      @user=ArtriverUser.find(session[:user_id])
      #@user=ArtriverUser.find(params[:artriver_user_id])
      #end 

      
    end
    






  end