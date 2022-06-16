class Group < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :board, class_name: 'Board'
end
