class ChangeNumberToBeStringInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :number, :string
  end
end
