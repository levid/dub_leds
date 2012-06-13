class AddUserIdToGenerator < ActiveRecord::Migration
  def change
    add_column :generators, :user_id, :integer
  end
end
