class CreateStaticPages < ActiveRecord::Migration
  def up
    create_table :static_pages do |t|
      t.timestamps
    end
    StaticPage.create_translation_table! vision_title: :string, vision_text: :text, values_text: :text, tasks_text: :text
  end

  def down
    drop_table :static_pages
    StaticPage.drop_translation_table!
  end

end


