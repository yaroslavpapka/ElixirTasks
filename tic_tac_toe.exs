defmodule TicTacToe do

  @type cell :: :x | :o | :f
  @type row :: {cell, cell, cell}
  @type game_state :: {row, row, row}
  @type game_result :: {:win, :x} | {:win, :o} | :no_win

  @spec valid_game?(game_state) :: boolean
  def valid_game?({{_, _, _}, {_, _, _}, {_, _, _}} = board) do
    board
    |> Tuple.to_list()
    |> Enum.flat_map(fn(elem) -> elem |> Tuple.to_list() end)
    |> Enum.all?(fn(elem) -> elem in [:x, :o, :f] end)
  end

  @spec valid_game?(game_state) :: boolean
  def valid_game?(_), do: false

  @spec check_who_win(game_state) :: game_result
  def check_who_win({{f,f,f},{_,_,_},{_,_,_}}) when f != :f, do: {:win, f}
  def check_who_win({{_,_,_},{f,f,f},{_,_,_}}) when f != :f, do: {:win, f}
  def check_who_win({{_,_,_},{_,_,_},{f,f,f}}) when f != :f, do: {:win, f}
  def check_who_win({{f,_,_},{f,_,_},{f,_,_}}) when f != :f, do: {:win, f}
  def check_who_win({{_,f,_},{_,f,_},{_,f,_}}) when f != :f, do: {:win, f}
  def check_who_win({{_,_,f},{_,_,f},{_,_,f}}) when f != :f, do: {:win, f}
  def check_who_win({{f,_,_},{_,f,_},{_,_,f}}) when f != :f, do: {:win, f}
  def check_who_win({{_,_,f},{_,f,_},{f,_,_}}) when f != :f, do: {:win, f}
  def check_who_win(_), do: :no_win

end
