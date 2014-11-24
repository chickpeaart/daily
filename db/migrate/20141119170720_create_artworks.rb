class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
    	t.string :name
    	t.integer :user_id
    	t.integer :subject_id
      t.timestamps
    end
  end
end
