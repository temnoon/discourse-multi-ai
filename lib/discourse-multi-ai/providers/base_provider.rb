module DiscourseMultiAi
  class BaseProvider
    def self.perform_completion(prompt:, model:, api_key:, **options)
      raise NotImplementedError
    end
  end
end
