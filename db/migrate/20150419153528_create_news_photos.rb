class CreateNewsPhotos < ActiveRecord::Migration
  def change
    create_table :news_photos do |t|
      t.string :photo
      t.references :news, index: true

      t.timestamps
    end
  end
end
