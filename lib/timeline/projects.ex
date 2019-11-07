defmodule Timeline.Projects do
  @help Application.get_env(:timeline, :projects_help)

  alias Timeline.Projects.{List, Alias}

  def display_help do
    IO.write(@help)
  end

  def run(args) do
    [action | args] = args
    dispatch_action(action, args)
  end

  defp dispatch_action(action, args) when action in ~w(aka alias) do
    Alias.run(args)
  end

  defp dispatch_action(action, args) when action in ~w(ls list) do
    List.run(args)
  end

  defp dispatch_action(_, _) do
    display_help()
  end
end
