class AddDetailsToShopProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_profiles, :img_url, :string
  end
end
