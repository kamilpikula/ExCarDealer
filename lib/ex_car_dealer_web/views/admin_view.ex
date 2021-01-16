defmodule ExCarDealerWeb.AdminView do
  use ExCarDealerWeb, :view
  alias ExCarDealer.Users

  defp name_buyer(id) when not is_nil(id) do
    user = Users.get_user!(id)
    "#{user.first_name} #{user.last_name}"
  end

  defp name_buyer(_) do
    "do zarezerwowania"
  end
end
