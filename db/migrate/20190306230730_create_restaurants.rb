class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :address
      t.decimal :latitude, precision: 15, scale: 8
      t.decimal :longitude, precision: 15, scale: 8
      t.string :phone_number
      t.string :website_url
      t.string :menu_url
      t.text :hours

      t.timestamps
    end
  end
end
