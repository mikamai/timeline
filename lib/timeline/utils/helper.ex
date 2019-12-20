defmodule Timeline.Utils.Helper do
  @moduledoc """
  Handles the output of help messages.
  """

  @resources ~w[entries projects]

  def get_resources do
    @resources
  end

  def display_help_for([resource, action]) when resource in @resources do
    action_help = resource <> "_" <> action <> "_help"

    Application.get_env(:timeline, String.to_atom(action_help))
    |> IO.write()
  end

  def display_help_for(resource) when resource in @resources do
    resource_help = resource <> "_help"

    Application.get_env(:timeline, String.to_atom(resource_help))
    |> IO.write()
  end

  def display_help_for(_) do
    Application.get_env(:timeline, :main_help)
    |> IO.write()
  end
end
