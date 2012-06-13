class AddGeneratorToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :generator_id, :integer
  end
end
