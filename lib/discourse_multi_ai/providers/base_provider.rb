module DiscourseMultiAi
  class BaseProvider
    def self.perform_completion(prompt:, model:, api_key:, **options)
      raise NotImplementedError, "Each provider must implement .perform_completion"
    end
  end
end
