require 'rails_helper'

RSpec.describe User, type: :model do

  context "ActiveModel validations" do
    it { expect(described_class.new).to validate_presence_of(:username) }
    it { expect(described_class.new).to validate_presence_of(:email) }
    it { expect(described_class.new).to validate_presence_of(:encrypted_password) }
  end

  context "ActiveRecord associations" do
    it { should belong_to(:role) }
    it { should have_many(:stocks) }
    it { should have_many(:markets) }
    it { should have_many(:transactions) }
    it { should have_many(:sale) }
    it { should have_many(:purchases) }
  end

  context "creation" do

    # Create role
    let(:buyer_role){ create :role, :buyer }
    let(:broker_role){ create :role, :broker }
    let(:admin_role){ create :role, :admin }

    let(:create_buyer) { create :user, :buyer, role_id: buyer_role.id}
    let(:create_broker) { create :user, :broker, role_id: broker_role.id}
    let(:create_admin) { create :user, :admin, role_id: admin_role.id}


    it { expect(create_buyer.errors).to be_empty }
    it { expect(create_broker.errors).to be_empty }
    it { expect(create_admin.errors).to be_empty }

    # it { 
    #   create_buyer.approve_buyers
    #   expect(create_buyer.approved).to eq true 
    # } # true
    # it { expect(create_broker.approved).to eq false } # false
    # it { expect(create_admin.approved).to eq false } # flse

  end
  
end