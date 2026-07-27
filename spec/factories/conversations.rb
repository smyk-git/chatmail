FactoryBot.define do
  factory :conversation do
    sequence(:subject) { |n| "Conversation #{n}" }

    # Conversation stores its creator as user_id (see Conversation#author);
    # there is no belongs_to :user, so set it explicitly.
    transient do
      author { create(:user) }
    end

    user_id { author.id }
  end
end
