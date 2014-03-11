defmodule Bix.List.Sessions do
  def run(args // []) do
    match = {{:n, :l, {:session, :_}},:_, :_}
    gaurd = []
    res = [:"$$"]
    IO.puts inspect :gproc.select([{match, gaurd, res}]) |> Enum.take 50
  end
  def help do
    IO.puts "List all sessions"
  end
end
