defmodule BoggleBoard.Solver do
  require BoggleBoard.Dictionary

  def find_words(boggle, start_position, visited, str, words) do
    visited = update_in(visited, [start_position], fn(_) -> true end)
    str = "#{str}#{boggle[start_position]}"

    if BoggleBoard.Dictionary.is_possible_word_prefix?(str) do
      adjacent(boggle, start_position, visited)
      |> Enum.reduce(words, fn(p, accs) ->
        find_words(boggle, p, visited, str,
          case BoggleBoard.Dictionary.is_word?(str) do
            true ->
              [str|accs]
            _    -> accs
          end)
      end)
    else
      words
    end
  end

  def solve(boggle) do
    boggle = to_boggle_map(boggle)

    boggle
    |> Map.keys
    |> Enum.reduce([], fn(np, words) ->
      find_words(boggle, np, %{}, "", []) ++ words
    end)
    |> Enum.uniq
  end

  def adjacent(boggle, {x, y}, visited) do
    (for x <- [x+1, x-1, x], y <- [y+1, y-1, y], do: {x, y})
    |> Enum.filter(fn(p) ->
      Access.get(boggle, p)!=nil and unvisited?(p, visited)
    end)
  end

  @doc """
  iex> BoggleBoard.Solver.to_boggle_map("RNES MOLZ KIEC EBNN")
 %{          {0, 0} => "R", {0, 1} => "M", {0, 2} => "K", {0, 3} => "E",
             {1, 0} => "N", {1, 1} => "O", {1, 2} => "I", {1, 3} => "B",
             {2, 0} => "E", {2, 1} => "L", {2, 2} => "E", {2, 3} => "N",
             {3, 0} => "S", {3, 1} => "Z", {3, 2} => "C", {3, 3} => "N"

  }
  """
  def to_boggle_map(boggle) do
    boggle
    |> String.split
    |> Enum.map(&(String.split(&1, "") |> List.delete("") |> Enum.with_index))
    |> Enum.with_index
    |> Enum.reduce(%{}, fn({row, y}, map) ->
      row |> Enum.reduce(map, fn({letter, x}, m) -> Map.put(m, {x,y}, letter) end)
    end)
  end

  defp unvisited?(position, visited) do
    is_nil(visited[position]) or visited[position]==false
  end
end
