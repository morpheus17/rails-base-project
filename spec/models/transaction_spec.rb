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
    let(:role) { create :role, :buyer }
    let(:buyer) { create:user, :buyer, role_id: role.id}
    let(:stock) { create :stock, :msft, user_id: buyer.id }
    let(:transaction) { create :transaction, :default, stock_id: stock.id, buyer_id: buyer.id}
    
    it { expect(transaction.total_amount).to be >= 0.01 }
    it { expect(transaction.quantity).to be >= 0.01 }
    it { expect(transaction.price).to be >= 0.01 }
  end
end