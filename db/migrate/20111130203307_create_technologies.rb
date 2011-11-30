class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|

      t.timestamps
    end
  end
end
