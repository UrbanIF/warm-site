class AddShowOnMineToNews < ActiveRecord::Migration
  def change
    add_column :news, :show_on_mine, :boolean, default: true
  end
end
