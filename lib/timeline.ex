defmodule Timeline do
  @moduledoc """
  Documentation for Timeline.
  """

  @help Application.get_env(:timeline, :main_help)

  alias Timeline.{Entries, Projects}

  def main([]) do
    display_help()
  end

  def main(args) do
    [resource | args] = args
    dispatch_resource(resource, args)
  end

  defp dispatch_resource(resource, []) do
    resource = "#{__MODULE__}.#{String.capitalize(resource)}"
    String.to_atom(resource).display_help()
  end

  defp dispatch_resource("entries", args) do
    Entries.run(args)
  end

  defp dispatch_resource("projects", args) do
    Projects.run(args)
  end

  defp dispatch_resource(_, _) do
    display_help()
  end

  defp display_help do
    IO.write(@help)
  end
end
