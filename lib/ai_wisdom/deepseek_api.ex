defmodule AiWisdom.DeepseekApi do
  @api_url "https://openrouter.ai/api/v1/chat/completions"

  def generate_ideas(topic) do
    api_key = Application.get_env(:ai_wisdom, :deepseek)[:api_key] || raise "DEEPSEEK_API_KEY não configurada"

    headers = [
      {"Authorization", "Bearer #{api_key}"},
      {"Content-Type", "application/json"}
    ]

    prompt = """
    Me sugira ideias criativas de projetos de portfolio de desenvolvedor sobre #{topic}.
    Inclua uma breve descrição para cada uma.
    Formate a resposta em tópicos claros em PTBR.
    """

    body =
      %{
        model: "openchat/openchat-7b:free",
        messages: [%{role: "user", content: prompt}],
        temperature: 0.7,
        max_tokens: 400
      }
      |> Jason.encode!()

      case HTTPoison.post(@api_url, body, headers) do
        {:ok, %{status_code: 200, body: response_body}} ->
          case Jason.decode(response_body) do
            {:ok, %{"choices" => [first_choice | _]}} ->
              {:ok, first_choice["message"]["content"]}

            {:ok, _} ->
              {:error, "Formato de resposta inesperado"}

            {:error, _} ->
              {:error, "Resposta inválida da API"}
          end

        {:ok, %{status_code: 404, body: _}} ->
          {:error, """
          Configuração necessária:
          1. Acesse https://openrouter.ai/settings/privacy
          2. Habilite 'Prompt Training'
          3. Tente novamente
          """}

        {:ok, %{status_code: status_code, body: body}} ->
          {:error, "Erro #{status_code}: #{Jason.decode!(body)["error"]["message"]}"}

        {:error, reason} ->
          {:error, "Falha na conexão: #{inspect(reason)}"}
      end
  end
end
