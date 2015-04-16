class AddShowMinePhotoToNews < ActiveRecord::Migration
  def change
    add_column :news, :show_mine_photo, :boolean, default: true
  end
end
