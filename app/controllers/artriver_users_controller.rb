class ArtriverUsersController < ApplicationController
  before_action :connected_user, :except =>[:login,:tentative_log,:logout]
  def new
    @user=ArtriverUser.new
  end


  def create
    @user=ArtriverUser.new

    #cf methode privée autorisation tout en bas
    @user=ArtriverUser.new(autorisation)

    if @user.save
      redirect_to(:action=>'index')
    else
      render('new')
    end


    
  end

  def show
   @user=ArtriverUser.find(params[:id])
  end



    



  def edit
@user = ArtriverUser.find(params[:id])

  end
  
  def update
    @user = ArtriverUser.find(params[:id])

    if @user.update_attributes(autorisation)
      redirect_to(:action => "index")
    else 
      render ('edit')
    end

    
  end


  


  def index
  @user=ArtriverUser.order('name')

  end

  def delete
    @user= ArtriverUser.find(params[:id])
  end
  
  def destroy
    @user= ArtriverUser.find(params[:id])
    if @user.destroy
      redirect_to(:action=> "index")
    else
      render('delete')
    end
      
    end  

  

  private
  def autorisation

  params.require(:user).permit(:name,:email,:password) 
  end


  
  
 
  

  end
