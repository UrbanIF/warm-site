class CreateNews < ActiveRecord::Migration
  def up
    create_table :news do |t|

      t.string :image, index: true
      t.timestamps

    end
    News.create_translation_table! title: :string, short: :text, body: :text
  end

  def down
    drop_table :news
    News.drop_translation_table!
  end
end
