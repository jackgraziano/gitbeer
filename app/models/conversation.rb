class Conversation < ApplicationRecord
  has_many :participants
  has_many :messages
  has_many :users, through: :participants
end