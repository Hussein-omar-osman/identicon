defmodule IdenticonWeb.ImageController do
  use IdenticonWeb, :controller
  alias Identicon.ImageGenerator

  def image(conn, params) do
    case Map.has_key?(params, "name") do
      false -> ImageGenerator.main("messi") |> continue(conn)
      true -> Map.get(params, "name") |> ImageGenerator.main() |> continue(conn)
    end
  end

  defp continue(img ,conn) do
    conn
      |> put_resp_content_type("image/jpeg")
      |> send_resp(:ok, img)
  end
end
