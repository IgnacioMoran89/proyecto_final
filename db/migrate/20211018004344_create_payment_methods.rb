class CreatePaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
