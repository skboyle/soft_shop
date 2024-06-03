class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :status
      t.boolean :awaiting_response
      t.text :notes
      t.text :resolution
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
