class SubjectsController < ApplicationController
  before_action :connected_user, :except =>[:login,:tentative_log,:logout]
  def new
  	@subject=Subject.new
  end
  def create

  	@subject=Subject.new(autorisation)
  	if @subject.save
  		redirect_to(:action=>'index')
  	else
  		render('new')
  	end


  	


  end
  def index
  	@subject=Subject.order('name')
  		
  end

  def show
  	@subject= Subject.find(params[:id])

  end

  def edit
  	@subject= Subject.find(params[:id])

  end

  def update
  	
  	@subject= Subject.find(params[:id])

  	if @subject.update_attributes(autorisation)
  		redirect_to(:action=>'index')
  	else
  		render('edit')
  	end

  end


  def delete
	@subject= Subject.find(params[:id])

  end
  def destroy
  	@subject= Subject.find(params[:id])



  	if @subject.destroy
  		redirect_to(:action=>'index')
  	else
  		render('delete')
  	end
  	
  end


  private
  def autorisation
  	params.require(:subject).permit(:name,:description)
  	
  end
end
