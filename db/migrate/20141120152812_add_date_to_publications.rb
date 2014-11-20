class AddDateToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :date, :date
  end
end
