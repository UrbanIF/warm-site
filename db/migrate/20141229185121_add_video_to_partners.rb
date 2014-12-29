class AddVideoToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :video, :string
  end
end
