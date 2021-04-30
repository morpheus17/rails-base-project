require "rails_helper"

RSpec.describe Role, type: :model do
  context "ActiveModel validations" do
    it { expect(described_class.new).to validate_presence_of(:role_name) }
  end

  context "ActiveRecord associations" do
    it { should have_many(:users) }
  end

  
  context "creation" do
    let(:buyer){ Role.create(role_name: "buyer") }
    let(:other){ Role.create(role_name: "other") }

    it { expect(buyer.errors).to be_empty }
    it { expect(other.errors.messages[:role_name][0]).to eq "other is not a valid user" }
  end

end