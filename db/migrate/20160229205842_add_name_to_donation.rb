class AddNameToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :name, :string
  end
end
