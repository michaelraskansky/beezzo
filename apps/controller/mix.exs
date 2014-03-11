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
    app_list = [:diameter, :gproc, :poolboy, :jiffy, :cberl, :dcca]  
    [mod: { Controller, [app_list] }]
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
    [
      { :gproc, github: "uwiger/gproc" },
      { :gen_leader, github: "garret-smith/gen_leader_revival" },
      { :dcca, in_umbrella: true}
    ]

  end
end
