class Artwork < ActiveRecord::Base
	belongs_to :artriver_user
	belongs_to :subject
end
