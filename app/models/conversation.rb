class Conversation < ApplicationRecord
  has_many :conversation_users, dependent: :destroy
  has_many :users, :through => :conversation_users
  has_many :messages, dependent: :destroy

  validates :subject, presence: true, length: { minimum:1, maximum: 255 }

  def author
    User.find_by(id: user_id)
  end

end
