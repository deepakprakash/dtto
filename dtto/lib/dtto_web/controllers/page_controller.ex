defmodule DttoWeb.PageController do
  use DttoWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def shortcut(conn, params) do

    config = %Directus.API.Config{
      access_token: Application.get_env(:dtto, :directus)[:access_token],
      base_url: Application.get_env(:dtto, :directus)[:base_url]
    }

    case Directus.API.Items.filter(config, "Links", "key", :eq, params["key"]) do
      [head | tail] when length(tail) == 0 ->
        redirect(conn, external: head["url"])
      [_ | _] ->
        conn
        |> put_status(:bad_requst)
        |> text("More than one result, should never happen.")
      [] ->
        conn
        |> put_status(:not_found)
        |> text("Empty results.")
      _ ->
        conn
        |> put_status(:internal_error)
        |> text("There was an error connecting to database provider.")
    end

  end
end
