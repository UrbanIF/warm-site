class AddShowInMainListToNews < ActiveRecord::Migration
  def change
    add_column :news, :show_in_main_list, :boolean, default: true
  end
end
