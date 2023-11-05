defmodule Directus.API do
  defmodule Config do
    @enforce_keys [:access_token]

    defstruct [:access_token, base_url: "https://sonio-directus.local.eu-west-3.data.sonio.cloud:4430"]
  end

  defmodule Items do
    defp extract(response = %Req.Response{}) do
      response.body["data"]
    end

    def list(config = %Config{}, collection_name) do
      Directus.API.request(config)
      |> Req.get!(url: "items/#{collection_name}")
      |> extract()
    end

    def filter(config = %Config{}, collection_name, field, :eq, value) do
      filter = "filter[#{field}][_eq]=#{value}"

      Directus.API.request(config)
      |> Req.get!(url: "items/#{collection_name}?#{filter}")
      |> extract()
    end

  end

  def request(config = %Config{}) do
    Req.new(
      base_url: config.base_url,
      auth: {:bearer, config.access_token},
      headers: [
        "Content-Type": "application/json"
      ]
    )
  end
end
