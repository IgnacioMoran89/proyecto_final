class Order < ApplicationRecord
  before_create :generate_number
  belongs_to :user
  belongs_to :shop_profile

  def generate_number(size)
    self.number ||= loop do
      random = random_candidate(size)
      break random unless self.class.exists?(number: random)
    end
  end

  def random_candidate(size)
    "#{hash_prefix}#{Array.new(size){rand(size)}.join}"
  end

  def hash_prefix
    "BO"
  end
  
  def hash_size
    9
  end
end
