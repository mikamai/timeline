defmodule Timeline.Projects.List do
  alias Timeline.Projects.List.Impl
  alias Timeline.Utils.Helper

  @timetable_api Application.get_env(:timeline, :timetable_api)

  def run(argv) do
    argv
    |> parse_argv()
    |> process()
  end

  def parse_argv(argv) do
    case Impl.parse(argv) do
      {[tasks: true], [], []} ->
        :tasks

      {[], [], []} ->
        :list

      _ ->
        :help
    end
  end

  def process(:tasks) do
    @timetable_api.get("mikamai", "projects")
    |> Impl.decode_response(:tasks)
  end

  def process(:list) do
    @timetable_api.get("mikamai", "projects")
    |> Impl.decode_response()
  end

  def process(_) do
    Helper.display_help_for("projects")
  end
end
