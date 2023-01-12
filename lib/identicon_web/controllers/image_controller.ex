defmodule IdenticonWeb.ImageController do
  use IdenticonWeb, :controller

  def image(conn, _params) do
    img = Identicon.ImageGenerator.main("john")
    conn
      |> put_resp_content_type("image/jpeg")
      |> send_resp(:ok, img)

  end
end
