class CreateAdverts < ActiveRecord::Migration[5.0]
  def change
    create_table :adverts do |t|
      t.text :description
      t.timestamps
    end
  end
end
