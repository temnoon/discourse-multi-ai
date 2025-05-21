# name: discourse-multi-ai
# about: Integrate multiple external AI providers into Discourse AI (OpenAI, Anthropic, Gemini, Groq)
# version: 0.1
# authors: Tem Noon, ChatGPT
# required_version: 3.2.0
# url: https://github.com/temnoon/discourse-multi-ai

enabled_site_setting :multi_ai_enabled

require_relative "lib/discourse_multi_ai/engine"

after_initialize do
  require_relative "lib/discourse_multi_ai/providers/base_provider"
  require_relative "lib/discourse_multi_ai/providers/openai_provider"
  require_relative "lib/discourse_multi_ai/providers/anthropic_provider"
  require_relative "lib/discourse_multi_ai/providers/gemini_provider"
  require_relative "lib/discourse_multi_ai/providers/groq_provider"

  DiscourseAi::Completions::BaseCompletions.register_provider(:openai, DiscourseMultiAi::OpenAiProvider)
  DiscourseAi::Completions::BaseCompletions.register_provider(:anthropic, DiscourseMultiAi::AnthropicProvider)
  DiscourseAi::Completions::BaseCompletions.register_provider(:gemini, DiscourseMultiAi::GeminiProvider)
  DiscourseAi::Completions::BaseCompletions.register_provider(:groq, DiscourseMultiAi::GroqProvider)
end
