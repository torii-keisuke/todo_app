class Board < ApplicationRecord
  has_many :group, class_name: "Group", foreign_key: "board_id"
  has_many :user, through: :group
  has_many :list
  validates :title, presence: true
end
