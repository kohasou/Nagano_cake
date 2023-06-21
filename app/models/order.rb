class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, bank: 1 }

end
