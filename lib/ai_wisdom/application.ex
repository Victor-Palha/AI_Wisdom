defmodule AiWisdom.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AiWisdomWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:ai_wisdom, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AiWisdom.PubSub},
      # Start a worker by calling: AiWisdom.Worker.start_link(arg)
      # {AiWisdom.Worker, arg},
      # Start to serve requests, typically the last entry
      AiWisdomWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AiWisdom.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AiWisdomWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
