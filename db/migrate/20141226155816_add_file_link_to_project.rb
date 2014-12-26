class AddFileLinkToProject < ActiveRecord::Migration
  def change
    add_column :projects, :file_link, :string
  end
end
