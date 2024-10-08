defmodule LiveviewList.MixProject do
  use Mix.Project

  def project do
    [
      app: :liveview_list,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6"},
      {:dialyxir, "~> 1.2", only: [:dev], runtime: false},
      {:jason, "~> 1.0"},
      {:mime, "~> 2.0.3"},
      {:phoenix, "~> 1.6"},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_live_view, "~> 0.18"},
      {:phoenix_pubsub, "~> 2.1.1"},
      {:phoenix_view, "~> 2.0"},
      {:plug, "~> 1.14"},
      {:plug_crypto, "~> 2.0"},
      {:telemetry, "~> 1.1"}
    ]
  end
end
