class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.integer  :id,             :null => false
      t.text     :description
      t.string   :title
      t.string   :sub_title
      t.string   :type

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
