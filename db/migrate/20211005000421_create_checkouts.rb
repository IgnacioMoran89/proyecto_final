class CreateCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts do |t|
      t.text :message
      t.text :signature
      t.string :recipient_name
      t.string :phone
      t.string :address
      t.string :city
      t.text :florist_instruction
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
