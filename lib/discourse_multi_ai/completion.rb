module DiscourseMultiAi
  class Completion
    def self.complete(provider:, prompt:, model:, api_key:, temperature: 0.7)
      case provider.to_s
      when "openai"
        OpenAiProvider.perform_completion(prompt: prompt, model: model, api_key: api_key, temperature: temperature)
      when "anthropic"
        AnthropicProvider.perform_completion(prompt: prompt, model: model, api_key: api_key, temperature: temperature)
      when "gemini"
        GeminiProvider.perform_completion(prompt: prompt, model: model, api_key: api_key, temperature: temperature)
      when "groq"
        GroqProvider.perform_completion(prompt: prompt, model: model, api_key: api_key, temperature: temperature)
      else
        raise ArgumentError, "Unknown provider: #{provider}"
      end
    end
  end
end
