defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

def callback(%{assigns: %{ueberauth_failure: fails}} = conn, _params) do
    IO.puts("FAILED AUTHENTICATION")
    IO.inspect(fails)
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    IO.puts("SUCCESSFUL AUTHENTICATION")
    IO.inspect(conn.assigns)
    
    # case UserFromAuth.find_or_create(auth) do
    #   {:ok, user} ->
    #     conn
    #     |> put_flash(:info, "Successfully authenticated.")
    #     |> put_session(:current_user, user)
    #     |> configure_session(renew: true)
    #     |> redirect(to: "/")

    #   {:error, reason} ->
    #     conn
    #     |> put_flash(:error, reason)
    #     |> redirect(to: "/")
    # end
  end
end  