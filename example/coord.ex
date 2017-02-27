defmodule Expart.Example.Coord do
  def start do
    Expart.start(mode: :coord, port: 9000, callback: Expart.Example.Logger)
    Expart.connect
  end

  def send(msg) do
    Expart.send_to(:"peer@peermachine", msg)
  end

  def broadcast(msg) do
    Expart.broadcast(msg)
  end

  def members do
    Expart.members
  end
end
