defmodule Formatter do
  @moduledoc """
  Handles the drawing of the output that displays the fetched data.
  """

  import Enum, only: [map: 2, map_join: 3]

  def list(things, option \\ nil)

  def list(things, :tasks) do
    things
    |> projects_with_tasks()
    |> map_join("\n", &format_tasks(&1))
    |> puts()
  end

  def list(things, _) do
    things
    |> map_join("\n", & &1.name)
    |> puts()
  end

  defp projects_with_tasks(projects) do
    map(projects, &[&1.name, for(task <- &1.tasks, do: task.name)])
  end

  defp format_tasks(project) do
    [name, tasks] = project
    tab = "\n\s\s:"

    name <> tab <> Enum.join(tasks, tab)
  end

  defp puts(string) do
    IO.puts("\n" <> string <> "\n")
  end
end
