class CreateAuthentications < ActiveRecord::Migration
  def up
    create_table :authentications do |t|
      t.string :uuid
      t.string :provider
      t.timestamps
    end
  end

  def down
    drop_table :authentications
  end
end
