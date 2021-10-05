class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :token
      t.string :state
      t.decimal :total
      t.references :checkout, foreign_key: true

      t.timestamps
    end
  end
end
