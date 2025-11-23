class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  after_create do
    MessageAnalysisJob.perform_later(self.id)
  end

  validates :body, presence: true

  DISPLAY_COUNT = 4

  def author
    user
  end

end
