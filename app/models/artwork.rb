class Artwork < ActiveRecord::Base
		
	
	belongs_to :artriver_user
	belongs_to :subject
	mount_uploader :image, ImageUploader
	#imageUploader est une classe

	
end
