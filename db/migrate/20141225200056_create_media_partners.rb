class CreateMediaPartners < ActiveRecord::Migration
  def change
    create_table :media_partners do |t|

      t.timestamps
      t.string :title
      t.string :logo
      t.string :url
    end
  end
end
