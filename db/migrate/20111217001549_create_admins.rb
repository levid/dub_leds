class CreateAdmins < ActiveRecord::Migration
  def up
    create_table :admins do |t|
      t.database_authenticatable
      t.lockable
      t.trackable
      t.timestamps
    end
  end

  def down
  end
end
