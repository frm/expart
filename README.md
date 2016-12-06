# Expart

Expart is a wrapper to [partisan](https://github.com/lasp-lang/partisan)'s
implementation of the [HyParView protocol](http://asc.di.fct.unl.pt/~jleitao/pdf/dsn07-leitao.pdf).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `expart` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:expart, "~> 0.1.0"}]
    end
    ```

  2. Ensure `expart` is started before your application:

    ```elixir
    def application do
      [applications: [:expart]]
    end
    ```

