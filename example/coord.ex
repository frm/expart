defmodule Expart.Example.Coord do
  def start do
    Expart.Node.start_link(mode: :coord, port: 9000, callback: Expart.Example.Logger)
    Expart.Node.connect
  end

  def send(msg) do
    Expart.Node.send_to(:"peer@peermachine", msg)
  end

  def broadcast(msg) do
    Expart.Node.broadcast(msg)
  end

  def members do
    Expart.Node.members
  end
end
