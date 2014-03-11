defmodule Controller do
  use Application.Behaviour
  def start(_type, args) do
    Controller.Supervisor.start_link args
  end
end
