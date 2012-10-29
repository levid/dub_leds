class AddAuthenticationsBelongToUsers < ActiveRecord::Migration
  def self.up
    create_table :authentications_users, :id => false do |t|
      t.references :authentication, :user
    end
  end

  def self.down
    drop_table :authentications_users
  end
end
