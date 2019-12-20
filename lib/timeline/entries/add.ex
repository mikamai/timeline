defmodule Timeline.Entries.Add do
  alias Timeline.Entries.Add.Conf

  def run(argv) do
    argv
    |> parse_argv()
    |> process()
  end

  def parse_argv(argv) do
    case Conf.parse(argv) do
      {_, [], _} ->
        :help

      {options, [project_task], []} ->
        Conf.overwrite_defaults(options) ++ Conf.split(project_task)

      _ ->
        :help
    end
  end

  def process(:help) do
    Helper.display_help_for("entries")
  end

  def process(options) when length(options) < 5 do
    IO.puts("Usage: timeline entries add <project>:<task> [OPTIONS]")
  end

  def process(options) do
    options
    |> Conf.fill_defaults()
    |> to_json()
    |> IO.puts()
  end

  defp to_json(options) do
    options
    |> Enum.into(%{})
    |> Jason.encode!()
  end
end
