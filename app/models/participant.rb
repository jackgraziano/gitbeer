class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  validates :user_id, presence: true
  validates :conversation_id, presence: true
end
