class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :category
      t.boolean :featured
      t.string :product_code
      t.text :description
      t.text :specifications
      t.string :operating_system
      t.float :price
      t.float :cost
      t.float :msrp
      t.integer :sale_count
      t.references :manufacturer, foreign_key: true

      t.timestamps
    end
  end
end
