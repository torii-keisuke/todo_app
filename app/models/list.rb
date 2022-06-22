class List < ApplicationRecord
  belongs_to :board
  has_many :cards
  validates :content, presence: true
end
