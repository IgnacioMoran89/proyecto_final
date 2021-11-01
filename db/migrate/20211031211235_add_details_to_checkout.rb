class AddDetailsToCheckout < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :delivery_date, :date
  end
end
