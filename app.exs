defmodule Distance do

  def distance({:point, x1, y1} , {:point, x2, y2}) do

    x_dist = x1 - x2
    y_dist = y1 - y2

    :math.pow(x_dist, 2) + :math.pow(y_dist, 2)
    |> :math.sqrt()
  end

  def point_inside_figure?(point, {:circle, center, radius}) do
    distance(point, center) <= radius
  end

  def point_inside_rect?({:point, x, y}, {:rect, tl, br}) do
    {:point, left_x, top_y} = tl
    {:point, right_x, bottom_y} = br
    x <= right_x and x >= left_x and y >= top_y and y <=  bottom_y
  end

end

ExUnit.start()

defmodule DistanceTest do
  use ExUnit.Case
  import Distance
  test "distance" do
    assert distance({:point, 0, 0}, {:point, 0, 100}) == 100.0
    assert distance({:point, 0, 0}, {:point, 100, 0}) == 100.0
    assert distance({:point, 0, 0}, {:point, 3, 4}) == 5.0
  end

  test "distance crash" do
    p1 = {:point, 10, 10}
    r= {:rect, {:point, 0, 0}, {:point, 20, 20}}
    assert_raise FunctionClauseError,
      fn -> distance(p1, r) == 4 end

  end

  test "point inside figure" do
    p1 = {:point, 10, 10}
    p2 = {:point, 10, 100}
    p3 = {:point, 0, 0}
    p4 = {:point, 0, -16}
    c= {:circle, {:point, 5, 5}, 20}

    assert point_inside_figure?(p1,c)
    refute point_inside_figure?(p2,c)
    assert point_inside_figure?(p3,c)
    refute point_inside_figure?(p4,c)
  end

  test "point inside rectangle" do
    p1 = {:point, 10, 10}
    p2 = {:point, 10, 100}
    p3 = {:point, 0, 0}
    p4 = {:point, 0, -16}
    r= {:rect, {:point, 0, 0}, {:point, 20, 20}}

    assert point_inside_rect?(p1,r)
    refute point_inside_rect?(p2,r)
    assert point_inside_rect?(p3,r)
    refute point_inside_rect?(p4,r)
  end

  test "point inside figure crash" do
    p0 = {:point, 100, 100}
    p1 = {:point, 0, 0}
    p2 = {:point, 10, 10}
    p3 = {:point, 10, 100}
    triangle = {:triangle, p1, p2, p3}

    assert_raise FunctionClauseError,
      fn -> point_inside_figure?(p0, triangle) end
  end
end
