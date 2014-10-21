class CreatePartners < ActiveRecord::Migration

  def up
    create_table :partners do |t|

      t.string :logo_color, index: true
      t.string :logo_black_and_white, index: true
      t.string :url, index: true
      t.timestamps

    end
    Partner.create_translation_table! title: :string, body: :text
  end

  def down
    drop_table :partners
    Partner.drop_translation_table!
  end
end
