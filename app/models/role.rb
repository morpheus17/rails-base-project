class Role < ApplicationRecord
    validates :role_name, presence: true
    validates :role_name, uniqueness: { case_sensitive: false }
    validates :role_name, inclusion: { in: ["admin", "broker", "buyer"], message: "%{value} is not a valid user" }

    has_many :users

    scope :brokers, -> { where(role_name: "broker") }
    scope :buyers, -> { where(role_name: "buyer") }
    scope :admin, -> { where(role_name: "admin") }
end
