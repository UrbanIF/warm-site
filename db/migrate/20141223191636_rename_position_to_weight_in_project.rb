class RenamePositionToWeightInProject < ActiveRecord::Migration
  def change
    rename_column :projects, :position, :weight
    change_column :projects, :weight, :integer, default: 0
  end
end
