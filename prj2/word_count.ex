defmodule WordCount do

  @doc """
  Count number of lines, words and symbols for a given file,
  returns tuple {num_lines, num_words, num_symbols}
  """
  def process_file(filename) do
    case File.read(filename) do
      {:ok, body} -> count(body)
      {:error, reason} -> {:error, reason}
    end
  end


  @doc ~S"""
  Count number of lines, words and symbols for a given string,
  returns tuple {num_lines, num_words, num_symbols}

  ## Example
  iex> WordCount.count("hello here\nand there")
  {2, 4, 20}
  """

    def count(data) do
      lines = String.split(data, ~r/\r\n|\n|\r/)
      num_lines = length(lines)

      words = String.split(data, ~r/\s+/)
      num_words = length(words)

      num_symbols = String.length(data)

      {num_lines, num_words, num_symbols}

    end

end
