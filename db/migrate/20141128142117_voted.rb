class Voted < ActiveRecord::Migration
  def change
  	add_column :artriver_users, :voted, :boolean

  end
end
