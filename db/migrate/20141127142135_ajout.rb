class Ajout < ActiveRecord::Migration
  def change
  	add_column :artriver_users, :user_admin, :boolean
  end
end
