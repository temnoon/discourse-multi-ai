module ::DiscourseMultiAi
  class TestController < ::ApplicationController
    requires_plugin ::DiscourseMultiAi

    before_action :ensure_admin

    def check
      provider = params[:provider]
      prompt = params[:prompt] || "Hello world"
      model = params[:model]
      api_key = params[:api_key]

      begin
        result = Completion.complete(
          provider: provider,
          prompt: prompt,
          model: model,
          api_key: api_key
        )
        render plain: "Result: #{result}"
      rescue => e
        render plain: "Error: #{e.class}: #{e.message}", status: 500
      end
    end
  end
end
