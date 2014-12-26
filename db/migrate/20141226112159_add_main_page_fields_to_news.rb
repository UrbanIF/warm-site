class AddMainPageFieldsToNews < ActiveRecord::Migration
  def up
    News.add_translation_fields! title_on_mine: :string, short_on_mine: :string
  end

  def down
    remove_column :news_translations, :title_on_mine, :short_on_mine
  end
end
