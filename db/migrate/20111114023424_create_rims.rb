class CreateRims < ActiveRecord::Migration
  def self.up
    create_table :rims do |t|
      t.integer  :id,             :null => false
      t.string   :title,          :null => false
      t.text     :description
      t.string   :color
      t.string   :size
      t.string   :fitting
      t.string   :color
      t.string   :image
      t.string   :medium_image
      t.string   :small_image

      t.timestamps
    end
  end

  def self.down
    drop_table :rims
  end
end


