defmodule Timeline do
  @moduledoc """
  Documentation for Timeline.
  """

  @resources ~w(entries projects)

  # alias Timeline.{Entries, Projects}
  import Support

  def main([]) do
    display_main_help()
  end

  def main(args) do
    [resource | args] = args
    dispatch_resource(resource, args)
  end

  defp dispatch_resource(resource, []) when resource in @resources do
    display_help_for(resource)
  end

  defp dispatch_resource(resource, args) when resource in @resources do
    resource = "#{__MODULE__}.#{String.capitalize(resource)}"
    String.to_atom(resource).run(args)
  end

  # defp dispatch_resource("entries", args) do
  #   Entries.run(args)
  # end

  # defp dispatch_resource("projects", args) do
  #   Projects.run(args)
  # end

  defp dispatch_resource(_, _) do
    display_main_help()
  end
end
