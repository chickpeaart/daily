class AddIndexOnArtworks < ActiveRecord::Migration
  def change

  	add_index :artworks, :user_id
  	add_index :artworks, :subject_id
  end
end
