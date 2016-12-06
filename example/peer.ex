defmodule Expart.Example.Peer do
  def start do
    Expart.Node.start_link(mode: :peer, port: 9001, callback: &__MODULE__.print/1)
    Expart.Node.connect({:"coord@coordmachine", {127, 0, 0, 1}, 9000})
  end

  def send(msg) do
    Expart.Node.send_to(:"coord@coordmachine", msg)
  end

  def broadcast(msg) do
    Expart.Node.broadcast(msg)
  end

  def members do
    Expart.Node.members
  end

  def print(msg) do
    IO.puts msg
  end
end
