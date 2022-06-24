class Board < ApplicationRecord
  has_many :group, class_name: "Group", foreign_key: "board_id"
  has_many :users, through: :group
  has_many :lists
  validates :title, presence: true
end
