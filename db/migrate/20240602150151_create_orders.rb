class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.boolean :refunded, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
