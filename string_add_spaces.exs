defmodule StringExample do

  def example() do
    ["a", "bb", "ccc", "hello", "ssomethinf-wordd", "short"]
  end

  def aling_words(words) do
    max_length = find_max_length(words)
    max_length
    Enum.map(words, fn word -> aling_word(word, max_length) end)
  end

  def find_max_length(words) do
    find_max_length(words, 0)
  end

  def find_max_length([], current_max), do: current_max

  defp find_max_length([word | words], current_max) do
    current_max = max(String.length(word), current_max)
    find_max_length(words, current_max)
  end

  def aling_word(word, length) do
    spaces = length - String.length(word)
    left_spaces = div(spaces, 2)
    rigth_spaces = spaces - left_spaces

    word
    |> add_spaces(:right, rigth_spaces)
    |> add_spaces(:left, left_spaces)
  end

  def add_spaces(str, _, 0), do: str
  def add_spaces(str, :left, spaces), do: add_spaces(" " <> str, :left, spaces - 1)
  def add_spaces(str, :right, spaces), do: add_spaces(str <> " ", :right, spaces - 1 )
end
