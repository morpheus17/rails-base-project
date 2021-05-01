class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, :encrypted_password, :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # validations
  belongs_to :role
  has_many :stocks, dependent: :nullify
  has_many :markets, dependent: :destroy
  has_many :transactions, through: :stocks
  
  has_many :sale, class_name: "Transaction", foreign_key: "seller_id", dependent: :nullify
  has_many :purchases, class_name: "Transaction", foreign_key: "buyer_id", dependent: :nullify

  # scoping
  scope :brokers, -> { joins(:role).merge(Role.brokers) }
  scope :buyers, -> { joins(:role).merge(Role.buyers) }
  scope :admin, -> { joins(:role).merge(Role.admin) }
  scope :unapproved_users, -> { where(approved: false) }
  scope :unapproved_users_count, -> { where(approved: false).count }

  # before and after creation
  before_create :approve_buyers
  after_create :send_admin_mail


  def send_admin_mail
    if Role.find_by(id: self.role_id)["role_name"] == "broker" # user is a broker
      AdminMailer.new_user_waiting_for_approval(self).deliver
    elsif Role.find_by(id: self.role_id)["role_name"] == "buyer" # user is a buyer
      AdminMailer.new_user_approved(self).deliver
    end
  end

  def approve_buyers
    # if self.role_id == 2 
    if Role.find_by(id: self.role_id)["role_name"] == "buyer"
      self.approved = true
    end
  end

  def approve_user
    self.approved = true
  end

  
  def active_for_authentication?
    super && approved? 
  end 
  
  def inactive_message 
    approved? ? super : :not_approved
  end

end
