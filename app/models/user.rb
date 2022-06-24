class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  has_many :group, class_name: "Group", foreign_key: "user_id"
  has_many :board, through: :group
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def is_confirmation_period_expired?
    self.confirmation_period_expired?
  end
end
