class CreateRims < ActiveRecord::Migration
  def change
    create_table :rims do |t|
      t.integer :id,              :null => false
      t.datetime :creation_date,  :null => false
      t.datetime :modified_date,  :null => false
      t.string :title,            :null => false
      t.text :description
      t.string :color
      t.string :size
      t.string :fitting
      t.string :color

      t.timestamps
    end
  end
end
