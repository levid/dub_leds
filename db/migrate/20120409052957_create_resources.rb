class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.integer  :id,             :null => false
      t.string   :resource_type
      t.text     :description
      t.string   :title
      t.string   :sub_title

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
