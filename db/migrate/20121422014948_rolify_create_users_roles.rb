class RolifyCreateUsersRoles < ActiveRecord::Migration
  def up
    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:users_roles, [ :user_id, :role_id ])
  end

  def down
    drop_table :users_roles
  end
end
