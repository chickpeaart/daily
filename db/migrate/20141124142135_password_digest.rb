class PasswordDigest < ActiveRecord::Migration
  def up
  	add_column "artriver_users","password_digest", :string


  end
  def down 

  	remove_column "artriver_users","password_digest"
  end

end
