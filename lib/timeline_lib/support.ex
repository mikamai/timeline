defmodule TimelineLib.Support do
  @resources ~w(entries projects)

  def get_resources, do: @resources

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