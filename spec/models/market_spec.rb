require 'rails_helper'

RSpec.describe Market, type: :model do
  # pure rspec
  context 'ActiveModel validations' do
    it { expect(described_class.new).to validate_presence_of :name }
  end

  #with shoulda matchers
  context 'ActiveRecord associations' do
    it { should belong_to(:user) } 
  end

  # pure rspec
  context 'creation' do
    # Create role
    let(:role) { create :role, :buyer }
    let(:buyer) { create :user, :buyer, role_id: role.id}

    let(:create_market) { create(:market, name: 'MSFT', user_id: buyer.id)}
    let(:create_market_wrong) { Market.create( name: 'M SFT', user_id: buyer.id)}
    let(:create_market_wrong1) { Market.create( name: ' MSFT', user_id: buyer.id)}
    
    it { expect(create_market.errors).to be_empty }
    it {expect(create_market_wrong.errors.messages[:name][0]).to eq "is invalid" }
    it { expect(create_market_wrong1.errors.messages[:name][0]).to eq "is invalid" }

  end
end