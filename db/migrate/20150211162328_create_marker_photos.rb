class CreateMarkerPhotos < ActiveRecord::Migration
  def change
    create_table :marker_photos do |t|
      t.string :photo
      t.string :title
      t.references :marker, index: true

      t.timestamps
    end
  end
end
