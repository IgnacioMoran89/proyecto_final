class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :img_url
      t.references :shop_profile, foreign_key: true

      t.timestamps
    end
  end
end
