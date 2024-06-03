class CreateSoftwareKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :software_keys do |t|
      t.string :key
      t.datetime :generated_at
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
