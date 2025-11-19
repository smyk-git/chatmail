class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :name, presence: true , length: { maximum: 50 }

  has_many :conversation_users, dependent: :destroy
  has_many :conversations, through: :conversation_usersu

  has_many :messages, dependent: :nullify

  def gravatar_url(size = 80)
    size = size.is_a?(Hash) ? size.values.first : size
    normalized_email = (email || "").strip.downcase
    hash = Digest::MD5.hexdigest(normalized_email)

    "https://www.gravatar.com/avatar/#{hash}?s=#{size}?s=#{size}&d=identicon&r=g"
  end

end
