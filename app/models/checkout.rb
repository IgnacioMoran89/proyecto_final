class Checkout < ApplicationRecord
  belongs_to :order, optional: true
end
