class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.integer  :id,             :null => false
      t.string   :email

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
