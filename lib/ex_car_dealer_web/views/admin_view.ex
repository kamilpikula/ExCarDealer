defmodule ExCarDealerWeb.AdminView do
  use ExCarDealerWeb, :view
  alias ExCarDealer.Users

  defp name_buyer(id) do
    user = Users.get_user!(id)
    "#{user.first_name} #{user.last_name}"
  end
end
