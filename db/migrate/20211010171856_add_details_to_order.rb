class AddDetailsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :subtotal, :decimal
  end
end
