class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :body, presence: true

  DISPLAY_COUNT = 4

  def author
    return "Author" if conversation.user_id == user.id
    user.name
  end

  def gravatar_url(size = 80)
    size = size.is_a?(Hash) ? size.values.first : size
    normalized_email = (email || "").strip.downcase
    hash = Digest::MD5.hexdigest(normalized_email)

    "https://www.gravatar.com/avatar/#{hash}?s=#{size}?s=#{size}&d=identicon&r=g"
  end
end
