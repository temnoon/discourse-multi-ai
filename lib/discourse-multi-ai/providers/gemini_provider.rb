require "net/http"
require "json"

module DiscourseMultiAi
  class GeminiProvider < BaseProvider
    def self.perform_completion(prompt:, model:, api_key:, temperature: 0.7)
      uri = URI("https://generativelanguage.googleapis.com/v1beta/models/#{model}:generateContent?key=#{api_key}")

      body = {
        contents: [{ parts: [{ text: prompt }] }],
        generationConfig: { temperature: temperature }
      }

      headers = { "Content-Type" => "application/json" }

      response = Net::HTTP.post(uri, body.to_json, headers)
      JSON.parse(response.body).dig("candidates", 0, "content", "parts", 0, "text")
    end
  end
end
