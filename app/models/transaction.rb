class Transaction < ApplicationRecord
    validates :price, presence: true, format: {with: /\A\d+(?:\.\d{0,2})?\z/, message:"only allows 0 to 2 decimal places"}, numericality: { greater_than_or_equal_to: 0.01 }
    validates :total_amount, presence: true, format: {with: /\A\d+(?:\.\d{0,2})?\z/, message:"only allows 0 to 2 decimal places"}, numericality: { greater_than_or_equal_to: 0.01 }
    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 } 

    belongs_to :stock
end
