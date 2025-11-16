class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :subject, presence: true, length: { minimum:1, maximum: 255 }
end
