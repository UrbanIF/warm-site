class AddSlugToProject < ActiveRecord::Migration
  def change
    add_column :projects, :slug, :string, null: false, default: ''
    add_index :projects, :slug, unique: true
  end
end
