class AddCityToMarker < ActiveRecord::Migration
  def change
    add_column :markers, :city, :string, default: ''
  end
end
