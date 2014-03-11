defmodule Bix do
  use Application.Behaviour
  def start(opts // [], callback // fn -> end) do
    spawn(
      fn ->
        case :init.notify_when_started(self()) do
          :started -> :ok
          _        -> :init.wait_until_started()
        end
        :io.setopts Process.group_leader, [expand_fun: &Bix.Autocomplete.expand(&1), binary: true, encoding: :unicode]
        Bix.Server.start(opts, callback)
      end
    )
    {:ok, self}
  end
end
