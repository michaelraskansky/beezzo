defmodule Bix.Server do

  def start(opts, callback) do
    run_loop
  end

  def run_loop do
    IO.gets(:stdio, "ocs> ")
    |> transform_binary
    |> evaluate(:run)
    run_loop
  end

  def configure_loop do
    IO.gets(:stdio, "ocs# ")
    |> transform_binary
    |> evaluate(:configure)
    configure_loop
  end

  def transform_binary("\n") do
    {:ok, :no_cmd}
  end

  def transform_binary(cmd) do
    {:ok, 
      cmd 
      |> String.split
      |> list_to_tuple
    }
  end

  def evaluate({:ok, {"configure"}}, :run) do
    configure_loop
  end

  def evaluate({:ok, :no_cmd}, _), do: :ok

  def evaluate({:ok, {"connect"}}, :run), do: Node.connect :"dcca@budsvirt"

  def evaluate({:ok, {"list", "sessions"}}, :run), do: Node.spawn(:"dcca@budsvirt", &Bix.List.Sessions.run/1)

  #Other
  def evaluate({:ok, cmd_tup}, atmos) do
    IO.puts inspect cmd_tup
  end
end
