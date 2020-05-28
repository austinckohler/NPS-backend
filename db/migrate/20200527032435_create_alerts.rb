class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :park_code
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
