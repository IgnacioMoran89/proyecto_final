class Checkout < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user, optional: true
end
