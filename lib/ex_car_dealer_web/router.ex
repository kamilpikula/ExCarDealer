defmodule ExCarDealerWeb.Router do
  use ExCarDealerWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ExCarDealerWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated,
      error_handler: ExCarDealerWeb.AuthErrorHandler
  end

  scope "/glowna", ExCarDealerWeb do
    pipe_through [:browser, :protected]

    get "/", MainController, :index
    delete "/wylogowywanie", SessionController, :delete, as: :logout
  end

  scope "/", ExCarDealerWeb do
    pipe_through [:browser, :not_authenticated]

    get "/", HomeController, :index
    get "/rejestracja", RegistrationController, :new
    post "/rejestracja", RegistrationController, :create
    get "/logowanie", SessionController, :new
    post "/logowanie", SessionController, :create
  end



  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ExCarDealerWeb.Telemetry
    end
  end
end
