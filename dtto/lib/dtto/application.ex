defmodule Dtto.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DttoWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:dtto, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Dtto.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Dtto.Finch},
      # Start a worker by calling: Dtto.Worker.start_link(arg)
      # {Dtto.Worker, arg},
      # Start to serve requests, typically the last entry
      DttoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dtto.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DttoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
