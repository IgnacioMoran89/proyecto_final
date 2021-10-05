class CreateShopProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_profiles do |t|
      t.string :name
      t.string :phone
      t.integer :rating
      t.text :comment
      t.string :address
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
