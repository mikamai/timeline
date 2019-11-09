defmodule Timeline.Projects.List do
  @moduledoc """
  Documentation for Timeline.Projects.List.
  """

  @options [
    aliases: [t: :tasks, h: :help],
    strict: [tasks: :boolean, help: :boolean]
  ]

  def run(args) do
    args
    |> parse_args()
    |> process()
  end

  def parse_args(args) do
    parsed = OptionParser.parse(args, @options)

    case parsed do
      {[help: true], _, _} ->
        :help

      {[tasks: true], [], []} ->
        :tasks

      {[], [], []} ->
        :list

      _ ->
        :help
    end
  end

  def process(:tasks) do
    TimetableApi.get("mikamai", "projects")
    |> decode_response(:tasks)
    |> IO.puts()
  end

  def process(:list) do
    TimetableApi.get("mikamai", "projects")
    |> decode_response()
    |> IO.puts()

    # |> print_table_for_columns(@headers)
  end

  def process(_) do
    Support.display_help_for("projects")
  end

  defp decode_response(response, option \\ nil)

  defp decode_response({:ok, projects}, :tasks) do
    Enum.map(
      projects,
      &[&1.name, for(task <- &1.tasks, do: task.name)]
    )
    |> Enum.map_join(
      "\n",
      &("#{List.first(&1)}#" <> Enum.join(List.last(&1), "#"))
    )
  end

  defp decode_response({:ok, projects}, _) do
    Enum.map(
      projects,
      & &1.name
    )
    |> Enum.join("\n")
  end

  defp decode_response({:error, details}, _) do
    IO.puts("error while fetching: `#{details}`")
  end
end
