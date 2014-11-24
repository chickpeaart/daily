class ArtriverUser < ActiveRecord::Base
	has_many :artworks
	has_secure_password
end
