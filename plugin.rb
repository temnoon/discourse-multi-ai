# name: discourse-multi-ai
# about: Integrate multiple external AI providers into Discourse
# version: 0.2
# authors: Tem Noon, ChatGPT
# required_version: 3.2.0
# url: https://github.com/temnoon/discourse-multi-ai

enabled_site_setting :multi_ai_enabled

require_relative "lib/discourse_multi_ai/engine"

# Eager load all providers
Dir[File.expand_path("../lib/discourse_multi_ai/providers/*.rb", __FILE__)].each do |file|
  require file
end

after_initialize do
  Rails.logger.info("[discourse-multi-ai] Plugin initialized. Providers available: OpenAI, Anthropic, Gemini, Groq.")

  # Future hook point: register tools or callbacks for summarizers, bots, etc.
  # Example: use DiscourseEvent for per-category or per-post interactions

  # Example safe registration placeholder:
  # DiscourseEvent.on(:post_created) do |post|
  #   if post.category&.name == "AI Chat"
  #     summary = DiscourseMultiAi::OpenAiProvider.perform_completion(
  #       prompt: post.raw,
  #       model: "gpt-4o",
  #       api_key: SiteSetting.openai_api_key
  #     )
  #     Rails.logger.info("[discourse-multi-ai] AI Summary: #{summary}")
  #   end
  # end
end
