class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, bank: 1 }
  has_many :order_details
  belongs_to :customer
end
