defmodule Controller.Mixfile do
  use Mix.Project

  def project do
    [ app: :controller,
      version: "0.0.1",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 0.12.4",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Controller, [] }]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  #
  # You can depend on another app in the same umbrella with:
  # { :other, in_umbrella: true }
  defp deps do
    []
  end
end
