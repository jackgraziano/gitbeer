class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  validates :user_id, presence: true
  validates :message, presence: true
  validates :conversation_id, presence: true
end
