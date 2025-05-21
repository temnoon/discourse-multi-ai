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
        messages: [{ role: "user", content: prompt }],
        temperature: temperature
      }

      response = Net::HTTP.post(uri, body.to_json, headers)
      JSON.parse(response.body).dig("content", 0, "text")
    end
  end
end
