class AddBigImageToProject < ActiveRecord::Migration
  def change
    add_column :projects, :big_image, :string

  end
end
