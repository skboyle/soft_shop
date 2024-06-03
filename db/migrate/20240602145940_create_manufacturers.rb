class CreateManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :endpoint
      t.string :contact_name
      t.string :contact_email

      t.timestamps
    end
  end
end
