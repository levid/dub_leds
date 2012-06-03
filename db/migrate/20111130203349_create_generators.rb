class CreateGenerators < ActiveRecord::Migration
  def change
    create_table :generators do |t|
      t.string :thumbnail
      t.string :preview
      t.timestamps
    end
  end
end
