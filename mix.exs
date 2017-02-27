defmodule Expart.Mixfile do
  use Mix.Project

  def project do
    [app: :expart,
     version: "0.1.0",
     description: description,
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:partisan, github: "lasp-lang/partisan"},
      {:credo, "~> 0.4", only: [:dev, :test]}
    ]
  end

  defp description do
    """
     Expart is simply a wrapper to Partisan's HyParView.
    """
  end

    defp package do
    [
     name: :expart,
     files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Fernando Mendes"],
     links: %{"GitHub" => "https://github.com/frmendes/expart"}
    ]
  end
end
