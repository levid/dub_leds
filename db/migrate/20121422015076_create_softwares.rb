class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name
      t.string :image
      t.string :download_url
      t.string :default_id

      t.timestamps
    end
  end
end
