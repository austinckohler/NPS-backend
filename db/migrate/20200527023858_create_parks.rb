class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :state
      t.text :url
      t.text :weather
      t.string :name
      t.string :lat_long
      t.text :description
      t.string :park_code

      t.timestamps
    end
  end
end
