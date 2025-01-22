return {
  "robitx/gp.nvim",
  opts = {
    providers = {
      openai = {
        endpoint = "https://api.openai.com/v1/chat/completions",
        secret = os.getenv("OPENAI_API_KEY"),
      }
    },
    agents = {
      {
			  name = "ChatGPT3-5",
			  disable = false,
			  chat = true,
			  command = true,
			  model = {model = "gpt-3.5-turbo"},
			  system_prompt = "Hello, how can I help you? ",
		  },
    },
  }
}

