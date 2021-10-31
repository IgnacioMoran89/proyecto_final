class AddReferencesToCheckout < ActiveRecord::Migration[5.2]
  def change
    add_reference :checkouts, :user, foreign_key: true
  end
end
