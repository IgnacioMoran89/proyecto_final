class ChangeRatingToBeStringInShopProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :shop_profiles, :rating, :string
  end
end
