defmodule BoggleBoard.Dictionary do

  require Retrieval

  use GenServer

  @name __MODULE__

  # API

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: @name)
  end

  def is_word?(str) do
    GenServer.call(@name, {:is_word, str})
  end

  def is_possible_word_prefix?(str) do
    GenServer.call(@name, {:is_possible_word_prefix, str})
  end

  # Callbacks

  def init(:ok) do
    word_list = File.stream!(Application.get_env(:boggle_board, :dict_path))
    |> Enum.map(&String.strip/1)

    {:ok, Retrieval.new(word_list)}
  end

  def handle_call({:is_word, str}, _from, trie) when is_binary(str) do
    {:reply, Retrieval.contains?(trie, str), trie}
  end
  def handle_call({:is_word, _non_str}, _from, trie), do: {:reply, false, trie}

  def handle_call({:is_possible_word_prefix, str}, _from, trie) when is_binary(str) do
    {:reply, (Retrieval.prefix(trie, str) |> length) > 0, trie }
  end
  def handle_call({:is_possible_word_prefix, _non_str}, _from, trie), do: {:reply, false, trie}
end
