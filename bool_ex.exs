defmodule BoolExample do
  defmodule Step1 do
    def sk_not(nil), do: nil
    def sk_not(arg), do: not arg

    def sk_and(false, _), do: false
    def sk_and(nil, false), do: false
    def sk_and(nil, _), do: nil
    def sk_and(true, second_arg), do: second_arg

    def sk_or(true, _), do: true
    def sk_or(nil, true), do: true
    def sk_or(nil, _), do: nil
    def sk_or(false, second_arg), do: second_arg
  end
end

ExUnit.start()

defmodule BoolExampleTest do
  use ExUnit.Case
  import BoolExample.Step1

  test "Stephen Kleene, not" do
    assert sk_not(true) == false
    assert sk_not(nil) == nil
    assert sk_not(false) == true
  end

  test "Stephen Kleene, and" do
    assert sk_and(false, false) == false
    assert sk_and(false, nil) == false
    assert sk_and(false, true) == false
    assert sk_and(nil, false) == false
    assert sk_and(nil, nil) == nil
    assert sk_and(nil, true) == nil
    assert sk_and(true, false) == false
    assert sk_and(true, nil) == nil
    assert sk_and(true, true) == true
  end

  test "Stephen Kleene, or" do
    assert sk_or(false, false) == false
    assert sk_or(false, nil) == nil
    assert sk_or(false, true) == true
    assert sk_or(nil, false) == nil
    assert sk_or(nil, nil) == nil
    assert sk_or(nil, true) == true
    assert sk_or(true, false) == true
    assert sk_or(true, nil) == true
    assert sk_or(true, true) == true
  end
end
