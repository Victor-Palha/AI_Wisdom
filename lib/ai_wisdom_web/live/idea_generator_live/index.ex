defmodule AiWisdomWeb.IdeaGeneratorLive.Index do
  use AiWisdomWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket,
      topic: "",
      ideas: nil,
      loading: false,
      error: nil,
      form: to_form(%{"topic" => ""})
    )}
  end

  def handle_event("generate", %{"topic" => topic}, socket) do
    socket = assign(socket,
      topic: topic,
      loading: true,
      error: nil
    )
    send(self(), {:run_generate, topic})
    {:noreply, socket}
  end

  def handle_info({:run_generate, topic}, socket) do
    case AiWisdom.DeepseekApi.generate_ideas(topic) do
      {:ok, ideas} ->
        {:noreply, assign(socket, ideas: ideas, loading: false)}

      {:error, error} ->
        {:noreply, assign(socket,
          loading: false,
          error: "⚠️ Erro: #{error}"
        )}
    end
  end
end
