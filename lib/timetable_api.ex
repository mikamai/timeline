defmodule TimetableApi do
  @moduledoc """
  Handles the request to the API.
  """

  require Logger

  @base_url Application.get_env(:timeline, :base_url)

  def get(orgs, resource) do
    Logger.info("fetching some #{orgs}'s #{resource}")

    url(orgs, resource)
    |> HTTPoison.get()
    |> handle_response()
  end

  defp url(orgs, resource) do
    "#{@base_url}/orgs/#{orgs}/users/me/#{resource}"
  end

  def handle_response({:ok, %{body: body}}) do
    Logger.info("successful response")
    Logger.debug(fn -> inspect(body) end)

    case Jason.decode(body, keys: :atoms) do
      {:ok, body} ->
        {:ok, body.data}

      {:error, details} ->
        {:error, "jason failed to compile `#{details.data}`"}
    end
  end

  def handle_response({:error, %{reason: details}}) do
    Logger.error("error `#{details}` returned")
    {:error, details}
  end
end
