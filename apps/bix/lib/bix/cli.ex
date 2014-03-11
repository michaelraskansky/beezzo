defmodule Bix.CLI do
  def start do
    :user_drv.start([:"tty_sl -c -e", tty_args])
  end

  defp tty_args do
    { :erlang, :apply, [local_start_function, []] }
  end

  def local_start do
    Bix.start
  end

  defp local_start_function do
    &local_start/0
  end
end
