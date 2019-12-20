defmodule Timeline.Projects do
  @moduledoc """
  Documentation for Projects.
  """

  alias Timeline.Projects.List
  alias Timeline.Utils.Helper

  def run(args) do
    [action | args] = args
    dispatch_action(action, args)
  end

  # defp dispatch_action(action, args) when action in ~w(aka alias) do
  #   Alias.run(args)
  # end

  defp dispatch_action(action, args) when action in ~w(ls list) do
    List.run(args)
  end

  defp dispatch_action(_, _) do
    Helper.display_help_for("projects")
  end
end
