class AddReferencesPayment < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :order, foreign_key: true
    add_reference :payments, :payment_method, foreign_key: true
  end
end
