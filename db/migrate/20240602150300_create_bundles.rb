class CreateBundles < ActiveRecord::Migration[7.0]
  def change
    create_table :bundles do |t|
      t.float :discount_amount

      t.timestamps
    end
  end
end
