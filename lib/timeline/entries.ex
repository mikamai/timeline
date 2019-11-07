defmodule Timeline.Entries do
  @help Application.get_env(:timeline, :entries_help)

  alias Timeline.Entries.{Add, List}

  def display_help do
    IO.write(@help)
  end

  def run(args) do
    [action | args] = args
    dispatch_action(action, args)
  end

  defp dispatch_action("add", args) do
    Add.run(args)
  end

  defp dispatch_action(action, args) when action in ~w(ls list) do
    List.run(args)
  end

  defp dispatch_action(_, _) do
    display_help()
  end
end
