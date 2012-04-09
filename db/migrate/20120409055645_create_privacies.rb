class CreatePrivacies < ActiveRecord::Migration
  def self.up
    create_table :privacies do |t|
      t.integer  :id,             :null => false
      t.string   :title
      t.text     :content

      t.timestamps
    end
  end

  def self.down
    drop_table :privacies
  end
end
