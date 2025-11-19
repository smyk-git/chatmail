class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :body, presence: true

  DISPLAY_COUNT = 4

  def author
    return "Author" if conversation.user_id == user.id
    user.name
  end
end
