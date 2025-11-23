class MessageAnalysisJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    message = Message.find(message_id)
    result = MessageAnalysisService.analyze(message)
    return unless result.present?

    message.update(analysis: result)
  end
end
