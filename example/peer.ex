defmodule Expart.Example.Peer do
  def start do
    Expart.start(mode: :peer, port: 9001, callback: &__MODULE__.print/1)
    Expart.connect({:"coord@coordmachine", {127, 0, 0, 1}, 9000})
  end

  def send(msg) do
    Expart.send_to(:"coord@coordmachine", msg)
  end

  def broadcast(msg) do
    Expart.broadcast(msg)
  end

  def members do
    Expart.members
  end

  def print(msg) do
    IO.puts msg
  end
end
