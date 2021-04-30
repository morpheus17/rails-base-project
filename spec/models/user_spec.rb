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
    let(:buyer_role){ Role.create(role_name: "buyer") }
    let(:broker_role){ Role.create(role_name: "broker") }
    let(:admin_role){ Role.create(role_name: "admin") }

    let(:create_buyer) { User.create(
      email: 'buyer@gmail.com',
      username: 'buyer',
      role_id: buyer_role.id,
      password:'123456',
      password_confirmation: '123456'
    )}

    let(:create_broker) { User.create(
      email: 'broker@gmail.com',
      username: 'broker',
      role_id: broker_role.id,
      password:'123456',
      password_confirmation: '123456'
    )}
    let(:create_admin) { User.create(
      email: 'admin@gmail.com',
      username: 'admin',
      role_id: admin_role.id,
      password:'123456',
      password_confirmation: '123456'
    )}

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