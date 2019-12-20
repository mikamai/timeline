defmodule Timeline.Entries.Add do
  alias Timeline.Entries.Add.Impl
  alias Timeline.Utils.Helper

  def run(argv) do
    argv
    |> parse_argv()
    |> process()
  end

  def parse_argv(argv) do
    case Impl.parse(argv) do
      {_, [], _} ->
        :help

      {options, [project_task], []} ->
        Impl.overwrite_defaults(options) ++ Impl.split(project_task)

      _ ->
        :help
    end
  end

  def process(:help) do
    Helper.display_help_for("entries")
  end

  def process(options) when length(options) < 5 do
    Helper.display_help_for(["entries", "add"])
  end

  def process(options) do
    options
    |> Impl.fill_defaults()
    |> to_json()
    |> IO.puts()
  end

  defp to_json(options) do
    options
    |> Enum.into(%{})
    |> Jason.encode!()
  end
end
