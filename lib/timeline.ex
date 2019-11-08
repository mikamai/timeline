defmodule Timeline do
  @moduledoc """
  Documentation for Timeline.
  """

  import TimelineLib.Support
  @resources get_resources()

  def main([]) do
    display_help_for(:main)
  end

  def main(args) do
    [resource | args] = args
    dispatch_resource(resource, args)
  end

  defp dispatch_resource(resource, []) when resource in @resources do
    display_help_for(resource)
  end

  defp dispatch_resource(resource, args) when resource in @resources do
    resource = "#{__MODULE__}." <> String.capitalize(resource)
    String.to_atom(resource).run(args)
  end

  defp dispatch_resource(_, _) do
    display_help_for(:main)
  end
end
