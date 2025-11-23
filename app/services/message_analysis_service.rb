require "httparty"

class MessageAnalysisService
  def self.analyze(message)
    body = {
      message_id:     message.id,
      user_id:        message.user_id,
      conversation_id: message.conversation_id,
      text:           message.body
    }

    response = HTTParty.post("http://localhost:9000/analyze", body: body.to_json, headers: { "Content-Type": "application/json" })
    return nil unless response.present?

    response.parsed_response.symbolize_keys
  end
end