defmodule ElixirDynamoCms.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixir_dynamo_cms,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [ElixirDynamoCms.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { ElixirDynamoCms, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "~> 0.1.0-dev", github: "dynamo/dynamo" } ]
  end
end
