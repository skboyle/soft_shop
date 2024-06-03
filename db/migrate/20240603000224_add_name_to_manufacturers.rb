class AddNameToManufacturers < ActiveRecord::Migration[7.0]
  def change
    add_column :manufacturers, :name, :string
  end
end
