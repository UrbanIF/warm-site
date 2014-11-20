class AddTablePublications < ActiveRecord::Migration
  def up
    create_table :publications do |t|
      t.timestamps
      t.string :link
      t.string :source_link
    end
    Publication.create_translation_table! title: :string, source: :string
  end

  def down
    drop_table :publications
    Publication.drop_translation_table!
  end
end
