class CreateGenerators < ActiveRecord::Migration
  def change
    create_table :generators do |t|
      t.string :thumbnail
      t.timestamps
    end
  end
end
