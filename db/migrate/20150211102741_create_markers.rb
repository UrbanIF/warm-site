class CreateMarkers < ActiveRecord::Migration
  def up
    create_table :markers do |t|
      t.string :latitude
      t.string :longitude
      t.string :address
      t.string :icon
      t.references :marker_group, index: true

      t.timestamps
    end
    Marker.create_translation_table! title: :string
  end

  def down
    drop_table :markers
    Marker.drop_translation_table!
  end
end
