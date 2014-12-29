class AddSlugToNews < ActiveRecord::Migration
  def up
    add_column :news, :slug, :string, default: ''
    News.all.each do |news|
      news.slug = news.date.strftime('%d%m%y')
      news.save!
    end

    add_index :news, :slug, unique: true
  end

  def down
    remove_column :news, :slug
  end
end
