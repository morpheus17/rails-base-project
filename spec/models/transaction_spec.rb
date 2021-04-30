require "rails_helper"

RSpec.describe Transaction, type: :model do
  
  context "ActiveModel validations" do
    it { expect(described_class.new).to validate_presence_of :total_amount }
    it { expect(described_class.new).to validate_presence_of :quantity }
    it { expect(described_class.new).to validate_presence_of :price }
  end

  context "ActiveRecord associations" do
    it { should belong_to(:stock)}
    it { should belong_to(:seller).optional }
    it { should belong_to(:buyer)}
  end

  context "creation" do
    let(:buyer_role){ Role.create(role_name: "buyer") }

    let(:buyer) { User.create(
      email: 'buyer@gmail.com',
      username: 'buyer',
      role_id: buyer_role.id,
      password:'123456',
      password_confirmation: '123456'
    )}

    let(:stock) {
      Stock.create(
        name: "MSFT",
        amount: 125.01,
        quantity: 1,
        user_id: buyer.id
    )}

    let(:transaction) {
      Transaction.create(
        total_amount: stock.amount,
        quantity: stock.quantity,
        price: 125.01,
        stock_id: stock.id, 
        seller_id: nil, 
        buyer_id: buyer.id
    )}
    
    it { expect(transaction.total_amount).to be >= 0.01 }
    it { expect(transaction.quantity).to be >= 0.01 }
    it { expect(transaction.price).to be >= 0.01 }
  end
end