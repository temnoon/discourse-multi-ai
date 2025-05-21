require "net/http"
require "json"

module DiscourseMultiAi
  class GroqProvider < BaseProvider
    def self.perform_completion(prompt:, model:, api_key:, temperature: 0.7)
      uri = URI("https://api.groq.com/openai/v1/chat/completions")

      headers = {
        "Authorization" => "Bearer #{api_key}",
        "Content-Type" => "application/json"
      }

      body = {
        model: model,
        messages: [{ role: "user", content: prompt }],
        temperature: temperature
      }

      response = Net::HTTP.post(uri, body.to_json, headers)
      json = JSON.parse(response.body)

      json.dig("choices", 0, "message", "content") || json["error"]&.to_s
    end
  end
end
