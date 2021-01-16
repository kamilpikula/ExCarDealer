defmodule ExCarDealerWeb.MainView do
  use ExCarDealerWeb, :view

  def format_price(price) do
    price
    |> Integer.to_charlist()
    |> Enum.reverse()
    |> Enum.chunk_every(3, 3, [])
    |> Enum.join(" ")
    |> String.reverse()
  end
end
