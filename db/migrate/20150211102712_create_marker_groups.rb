class CreateMarkerGroups < ActiveRecord::Migration
  def up
    create_table :marker_groups do |t|
      t.string :color

      t.timestamps
    end
    MarkerGroup.create_translation_table! title: :string
  end

  def down
    drop_table :marker_groups
    MarkerGroup.drop_translation_table!
  end
end
