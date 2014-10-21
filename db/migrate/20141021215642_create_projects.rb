class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|

      t.string :image, index: true
      t.string :type, index: true
      t.boolean :is_show
      t.integer :position, index: true

      t.timestamps
    end
    Project.create_translation_table! title: :string, short: :text, body: :text
  end

  def down
    drop_table :projects
    Project.drop_translation_table!
  end
end
