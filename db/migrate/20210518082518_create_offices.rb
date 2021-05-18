class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.string :city
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
