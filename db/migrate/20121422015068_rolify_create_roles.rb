class RolifyCreateRoles < ActiveRecord::Migration
  def up
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end
    
    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
  end

  def down
    drop_table :roles
  end
end
