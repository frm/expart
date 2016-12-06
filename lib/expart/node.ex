defmodule Expart.Node do
  use GenServer

  ## Public API

  # Supported options:
  # - mode: :coord, :peer
  # - port: own partisan port
  # - callback: reference to a receiver callback
  def start_link(opts) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
    cast({:setup, opts})
  end

  def connect(coord, {_, _, _, _} = ip, port), do:
    call({:connect, {coord, ip, port}})

  def connect(coord), do:
    call({:connect, coord})

  def connect,
    do: connect({})

  def members do
    {:ok, view} = manager.members
    view
  end

  def broadcast(msg) do
    members
    |> Enum.each(&(send_to &1, msg))
  end

  def send_to(name, msg) do
    manager.forward_message(name, __MODULE__, {:message, msg})
  end

  ## GenServer callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call(:callback, _from, opts) do
    {:reply, opts[:callback], opts}
  end

  def handle_call({:connect, coord}, _from, opts) do
    :partisan_config.set(:partisan_peer_service_manager,
                       :partisan_hyparview_peer_service_manager)

    :partisan_config.set(:peer_port, opts[:port])
    :partisan.start
    if opts[:mode] == :peer, do: :partisan_peer_service.join(coord)

    {:reply, :ok, opts}
  end

  def handle_cast({:setup, settings}, opts) do
    opts = parse_opts(settings)
    {:noreply, opts}
  end

  def handle_cast({:message, msg}, opts) do
    opts[:callback].(msg)
    {:noreply, opts}
  end

  ## Internal API

  defp cast(args), do: GenServer.cast(__MODULE__, args)
  defp call(args), do: GenServer.call(__MODULE__, args)

  defp manager, do: :partisan_peer_service.manager

  defp callback, do: call(:callback)

  defp parse_opts(settings) do
    settings
    |> Enum.into(%{})
    |> Map.put(:callback, as_func_ref(settings[:callback]))
  end

  defp as_func_ref(ref) when is_function(ref), do: ref
  defp as_func_ref(ref) when is_atom(ref), do: &ref.recv/1
end
