class CreateBundlesProductsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bundles, :products do |t|
      t.index [:bundle_id, :product_id]
      t.index [:product_id, :bundle_id]
    end
  end
end
