defmodule Identicon.ImageGenerator do
  alias Identicon.Image

   def main(input) do
    input |> hash_input |> pick_color |> build_grid |> filter_odd_squares |> build_pixel_map |> draw_image
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input) |> :binary.bin_to_list
    %Image{hex: hex}
  end

  def pick_color(image) do
    %Image{hex: [r, g, b | _tail]} = image
    %Image{image | color: {r, g, b}}
  end

  def build_grid(%Image{hex: hex} = image) do
    grid = hex |> Enum.chunk(3) |> Enum.map(&mirror_row/1) |> List.flatten |> Enum.with_index
    %Image{image | grid: grid}
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second , first]
  end

  def filter_odd_squares(%Image{grid: grid} = image) do
    new_grid = Enum.filter grid, fn({code, _index}) ->
                rem(code, 2) == 0
              end
    %Image{image | grid: new_grid}
  end

  def build_pixel_map(%Image{grid: grid} = image) do

    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 100
      vertical = div(index, 5) * 100

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 100, vertical + 100}

      {top_left, bottom_right}
    end

    %Image{image | pixel_map: pixel_map}
  end

  def draw_image(%Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(500, 500)
    fill = :egd.color(color)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end

    :egd.render(image)
  end

end
