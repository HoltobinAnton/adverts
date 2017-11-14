class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :address
      t.string :state
      t.string :country
      t.integer :zip
      t.timestamps
    end
  end
end
