require "rails_helper"

RSpec.describe Stock, type: :model do
  
  context "ActiveModel validations" do
    it { expect(described_class.new).to validate_presence_of :name }
    it { expect(described_class.new).to validate_presence_of :amount }
    it { expect(described_class.new).to validate_presence_of :quantity }
  end

  context "ActiveRecord associations" do
    it { should belong_to(:user)}
    it { should have_many(:transactions)}
  end
end