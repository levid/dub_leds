class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.integer  :id,             :null => false
      t.text     :page_content
      t.string   :title
      t.text     :sub_title
      t.string   :resource_type

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
