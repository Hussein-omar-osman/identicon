defmodule IdenticonWeb.DefaultView do
  use IdenticonWeb, :view

  def render("ack.json", %{success: success, message: message}) do
     %{success: success, message: message}
  end
end
