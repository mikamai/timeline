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
  end

  def process(:list) do
    TimetableApi.get("mikamai", "projects")
    |> decode_response()
    # |> print_table_for_columns(@headers)
  end

  def process(_) do
    Support.display_help_for("projects")
  end

  def decode_response(response, option \\ nil)

  def decode_response({:ok, projects}, :tasks) do
    Enum.map(
      projects,
      &{String.to_atom(&1.name), for(task <- &1.tasks, do: task.name)}
    )
  end

  def decode_response({:ok, projects}, _) do
    Enum.map(
      projects,
      &(&1.name)
    )
    |> Enum.join("\n")
  end

  def decode_response({:error, details}, _) do
    IO.puts("error while fetching: `#{details}`")
  end
end
