class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :email
      t.string :amount
      t.string :paid_sum
      t.datetime :paid_at
      t.string :paid_status
      t.string :paid_order_id
      t.string :paid_transaction_id
      t.string :status
      t.boolean :success, default: false

      t.timestamps
    end
  end
end
