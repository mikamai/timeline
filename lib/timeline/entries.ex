defmodule Timeline.Entries do
  @moduledoc """
  Documentation for Entries.
  """

  alias Timeline.Entries.Add
  alias Timeline.Utils.Helper

  def run(args) do
    [action | args] = args
    dispatch_action(action, args)
  end

  defp dispatch_action("add", args) do
    Add.run(args)
  end

  # defp dispatch_action(action, args) when action in ~w(ls list) do
  #   List.run(args)
  # end

  defp dispatch_action(_, _) do
    Helper.display_help_for("entries")
  end
end
