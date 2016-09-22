defmodule BoggleBoard do
  import Supervisor.Spec, warn: false
  
  def start(_type, _args) do
    children = [worker(BoggleBoard.Dictionary, [])]
    opts = [strategy: :one_for_one, name: BoggleBoard.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
