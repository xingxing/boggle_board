defmodule BoggleBoard do
  
  @dictionary ~w/GEEKS FOR QUIZ GO/

  @boggle %{
    {0,0}=> "G", {0,1} => "I", {0,2} => "Z",
    {1,0}=> "U", {1,1} => "E", {1,2} => "K",
    {2,0}=> "Q", {2,1} => "S", {2,2} => "E"
  }

  def is_word?(str) do
    @dictionary
    |> Enum.find_value(&(&1==str))
  end

  def find_words(visited, current_position={_, _}, str, words \\ []) do
    visited = update_in(visited, [current_position], fn(_) -> true end)
    str = "#{str}#{@boggle[current_position]}"

    words = if is_word?(str) do
      IO.puts str
      [str|words]
    else
     words
    end
    
    adjacent(current_position, visited)
    |> Enum.reduce(words, fn(p, acc) ->
      find_words(visited, p, str, words) ++ words
    end)

    words
  end

  def main() do
    visited = %{}
    str = ""

    @boggle
    |> Map.keys
    |> Enum.reduce([], fn(x, acc) ->
       find_words(visited, x, str) ++ acc
    end)
  end

  defp unvisited?(position, visited) do
    is_nil(visited[position]) or visited[position]==false
  end

  def adjacent({x, y}, visited) do
    (for x <- [x+1, x-1, x], y <- [y+1, y-1, y], do: {x, y})
    |> Enum.filter(fn(p)-> Access.get(@boggle, p)!=nil and unvisited?(p, visited) end)
  end
end
