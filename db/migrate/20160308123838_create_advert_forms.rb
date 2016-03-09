class CreateAdvertForms < ActiveRecord::Migration
  def change
    create_table :advert_forms do |t|
      t.string :company_title
      t.string :address
      t.boolean :advice
      t.boolean :layout
      t.string :name
      t.string :phone
      t.string :email
      t.string :photo
      t.string :logo

      t.timestamps
    end
  end
end
