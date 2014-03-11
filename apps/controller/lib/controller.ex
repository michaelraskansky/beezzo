defmodule Controller do
  use Application.Behaviour
  def start(_type, _args) do
    Controller.Supervisor.start_link
  end
end
