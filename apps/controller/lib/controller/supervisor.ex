defmodule Controller.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      # Define workers and child supervisors to be supervised
      # worker(Controller.Worker, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
