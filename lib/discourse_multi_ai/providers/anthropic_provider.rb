require "net/http"
require "json"

module DiscourseMultiAi
  class AnthropicProvider < BaseProvider
    def self.perform_completion(prompt:, model:, api_key:, temperature: 0.7)
      uri = URI("https://api.anthropic.com/v1/messages")

      headers = {
        "x-api-key" => api_key,
        "anthropic-version" => "2023-06-01",
        "content-type" => "application/json"
      }

      body = {
        model: model,
        max_tokens: 1024,
        temperature: temperature,
        messages: [
          { role: "user", content: prompt }
        ]
      }

      response = Net::HTTP.post(uri, body.to_json, headers)
      json = JSON.parse(response.body)

      json.dig("content", 0, "text") || json["content"] || json["completion"]
    end
  end
end
