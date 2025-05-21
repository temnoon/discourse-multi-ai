# discourse-multi-ai

**Multi-provider AI integration plugin for Discourse**

This plugin adds support for multiple external AI providers into the [Discourse AI plugin](https://github.com/discourse/discourse-ai), including:

- 🔷 OpenAI (GPT-4o, GPT-3.5, DALL-E, etc.)
- 🟠 Anthropic (Claude 3 models)
- 🟢 Google Gemini / Gemma
- 🔴 Groq-hosted open source models (Mixtral, LLaMA, etc.)

Created and maintained by [@temnoon](https://github.com/temnoon)

---

## ✨ Features

- Extend Discourse AI with modular, pluggable provider support
- Use your own API keys
- Select model and provider dynamically
- Designed to integrate with AI-powered tools like summarization, chat, and moderation
- Easy to expand — add new providers by subclassing `BaseProvider`

---

## 📦 Installation

Add this plugin to your Discourse installation:

1. SSH into your server and edit the `containers/app.yml` file
2. Add the following under `hooks > after_code`:

   ```yaml
   hooks:
     after_code:
       - exec:
           cd: $home/plugins
           cmd:
             - git clone git@github.com:temnoon/discourse-multi-ai.git
