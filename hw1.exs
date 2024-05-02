defmodule QuadraticEquation do
  @moduledoc """
  https://en.wikipedia.org/wiki/Quadratic_equation
  """

  @doc """
  function accepts 3 integer arguments and returns:
  {:roots, root_1, root_2} or {:root, root_1} or :no_root

  ## Examples
  iex> QuadraticEquation.solve(1, -2, -3)
  {:roots, 3.0, -1.0}
  iex> QuadraticEquation.solve(3, 5, 10)
  :no_roots
  """
  def solve(a, b, c) do
    discrim = :math.pow(b, 2) - 4*a*c

    cond do
      discrim > 0 -> {:roots, ((-b + :math.sqrt(discrim))/(2*a)), ((-b - :math.sqrt(discrim))/(2*a))}
      discrim == 0 -> {:root, ((-b )/(2*a))}
      discrim < 0 -> :no_roots
    end
  end
end

ExUnit.start()

defmodule QuadraticEquationTest do
  use ExUnit.Case
  import QuadraticEquation

  test "solve" do
    assert solve(1, -2, -3) == {:roots, 3, -1}
    assert solve(-1, -2, 15) == {:roots, -5, 3}
    assert solve(1, 12, 36) == {:root, -6}
    assert solve(5, 3, 7) == :no_roots
  end

  test "solve reduced" do
    assert solve(4, 0, -9) == {:roots, 1.5, -1.5}
    assert solve(1, -7, 0) == {:roots, 7, 0}
    assert solve(42, 0, 0) == {:root, 0}
    assert solve(5, 0, 30) == :no_roots
  end

end
