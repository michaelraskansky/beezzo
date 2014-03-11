defmodule Controller.Supervisor do
  use Supervisor.Behaviour

  def start_link(args) do
    :supervisor.start_link(__MODULE__, args)
  end

  def init(args) do
    children = [
      worker(Controller.Server, args)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
