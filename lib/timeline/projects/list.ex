defmodule Timeline.Projects.List do
  @moduledoc """
  Documentation for Timeline.Projects.List.
  """

  import Support, only: [display_help_for: 1]

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
    IO.puts("Finreach#tasks\nGabetti#tasks")
  end

  def process(:list) do
    IO.puts("Finreach\nGabetti")
  end

  def process(_) do
    display_help_for("projects")
  end
end
