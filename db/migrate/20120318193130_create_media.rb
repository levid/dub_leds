class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :description
      t.string :video_url
      t.string :thumbnail

      t.timestamps
    end
  end
end
