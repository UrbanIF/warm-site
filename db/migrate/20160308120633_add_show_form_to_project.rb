class AddShowFormToProject < ActiveRecord::Migration
  def change
    add_column :projects, :show_form, :boolean, default: false
  end
end
