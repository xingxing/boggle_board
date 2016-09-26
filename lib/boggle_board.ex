defmodule BoggleBoard do
  import Supervisor.Spec, warn: false
  
  def start(_type, _args) do
    children = [worker(BoggleBoard.Dictionary, []),
                worker(BoggleBoard.Solver, [])]

    opts = [strategy: :one_for_all, name: BoggleBoard.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
