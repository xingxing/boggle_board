defmodule BasicBench do
  use Benchfella

  @boggle "RNES MOLZ KIEC EBNN"

  setup_all do
    BoggleBoard.Dictionary.start_link
  end

  bench "solve" do
    BoggleBoard.Solver.solve(@boggle)
  end
end
