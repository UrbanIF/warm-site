class AddProjectToNews < ActiveRecord::Migration
  def change
  add_reference :news, :project, index: true
  end
end
