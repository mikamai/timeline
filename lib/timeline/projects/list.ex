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
  end

  def process(_) do
    Helper.display_help_for("projects")
  end

  defp decode_response(response, option \\ nil)

  defp decode_response({:ok, projects}, :tasks) do
    Formatter.list(projects, :tasks)
  end

  defp decode_response({:ok, projects}, _) do
    Formatter.list(projects)
  end

  defp decode_response({:error, details}, _) do
    IO.puts("\nerror while fetching: `#{details}`")
  end
end
