class CreateRefunds < ActiveRecord::Migration
  def self.up
    create_table :refunds do |t|
      t.integer  :id,             :null => false
      t.string   :title
      t.text     :content

      t.timestamps
    end
  end

  def self.down
    drop_table :refunds
  end
end
