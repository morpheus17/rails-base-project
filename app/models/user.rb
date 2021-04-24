class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
         

  belongs_to :role
  has_many :stocks, dependent: :nullify
  has_many :markets, dependent: :destroy
  
  has_many :sale, class_name: "Transaction", foreign_key: "seller_id", dependent: :nullify
  has_many :purchases, class_name: "Transaction", foreign_key: "buyer_id", dependent: :nullify

  after_create :send_admin_mail
  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(email).deliver
  end
  
  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    approved? ? super : :not_approved
  end

end
