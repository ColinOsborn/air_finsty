class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.string :home_type
      t.string :rental_type
      t.integer :accommodate
      t.integer :bedroom
      t.integer :bathroom
      t.string  :listing_name
      t.text    :summary
      t.string  :address
      t.boolean :tv
      t.boolean :kitchen
      t.boolean :ac
      t.boolean :heat
      t.boolean :internet
      t.integer :price
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
