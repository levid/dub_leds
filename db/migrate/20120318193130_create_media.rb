class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.string :video_url

      t.timestamps
    end
  end
end
