defmodule Noosphere.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NoosphereWeb.Telemetry,
      Noosphere.Repo,
      {DNSCluster, query: Application.get_env(:noosphere, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Noosphere.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Noosphere.Finch},
      # Start a worker by calling: Noosphere.Worker.start_link(arg)
      # {Noosphere.Worker, arg},
      # Start to serve requests, typically the last entry
      NoosphereWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Noosphere.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NoosphereWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
