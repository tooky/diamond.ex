defmodule DiamondTest do
  use ExUnit.Case
  doctest Diamond

  test "center of a is a" do
    assert Diamond.center("a") == "a"
  end

  test "center of b is b.b" do
    assert Diamond.center("b") == "b.b"
  end

  test "center of c is c...c" do
    assert Diamond.center("c") == "c...c"
  end

  test "lines for b" do
    assert Diamond.lines("b", "b") == [".a."]
  end

  test "lines for c" do
    assert Diamond.lines("c", "c") == [".b.b.", "..a.."]
  end

  test "new for a" do
    assert Diamond.new("a") == "a"
  end

  test "new for b" do
    assert Diamond.new("b") == ".a.\nb.b\n.a."
  end

  test "new for e" do
    assert Diamond.new("e") == String.rstrip("""
      ....a....
      ...b.b...
      ..c...c..
      .d.....d.
      e.......e
      .d.....d.
      ..c...c..
      ...b.b...
      ....a....
      """)
  end
end
