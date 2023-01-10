defmodule IdenticonWeb.DefaultController do
  use IdenticonWeb, :controller

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _) do
    conn |> render("ack.json", %{success: true, message: "#{Mix.env()} testing endpoint"})
  end
end
