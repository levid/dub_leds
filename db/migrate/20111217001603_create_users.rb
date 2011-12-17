class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.database_authenticatable
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.timestamps
    end
  end

  def down
  end
end
