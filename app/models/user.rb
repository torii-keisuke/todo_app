class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :group, class_name: "Group", foreign_key: "user_id"
  has_many :board, through: :group
  validates :name, presence: true
end
