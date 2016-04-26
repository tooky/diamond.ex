defmodule Diamond do
  def center("a"), do: "a"

  def center(<<center_char::utf8>> = center_string) do
    center_string <> inner_padding(center_char) <> center_string
  end

  def lines("a", _), do: []

  def lines(<<first_char::utf8>>, <<center_char::utf8>> = center_string) do
    next_char = first_char-1
    [
      padded_center(next_char, center_char) |
      lines(<<next_char::utf8>>, center_string)
    ]
  end

  def new("a"), do: "a"

  def new(char) do
    all_lines = top(char) ++ [center(char)] ++ bottom(char)
    Enum.join(all_lines, "\n")
  end

  def top(center) do
    Enum.reverse(lines(center, center))
  end

  def bottom(center) do
    lines(center, center)
  end

  defp inner_padding(char) do
    size = (char - ?a) * 2 - 1
    String.duplicate(".", size)
  end

  defp padded_center(char, center_char) do
    padding_size = center_char - char
    padding = String.duplicate(".", padding_size)
    padding <> center(<<char::utf8>>) <> padding
  end

end
