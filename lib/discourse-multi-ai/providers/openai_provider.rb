require "net/http"
require "json"

module DiscourseMultiAi
  class OpenAiProvider < BaseProvider
    def self.perform_completion(prompt:, model:, api_key:, temperature: 0.7)
      uri = URI("https://api.openai.com/v1/chat/completions")
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
      JSON.parse(response.body)["choices"].first["message"]["content"]
    end
  end
end
