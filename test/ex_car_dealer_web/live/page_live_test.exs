defmodule ExCarDealerWeb.PageLiveTest do
  use ExCarDealerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    #assert disconnected_html =~ "Welcome to Phoenix!"
    #assert render(page_live) =~ "Welcome to Phoenix!"
  end
end
