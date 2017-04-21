class Conversation < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :participants
end
