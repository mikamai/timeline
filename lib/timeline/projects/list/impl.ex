defmodule Timeline.Projects.List.Impl do
  alias Timeline.Utils.Formatter

  @opts [
    aliases: [t: :tasks],
    strict: [tasks: :boolean]
  ]

  @doc """
  ## Examples

      iex> Timeline.Projects.List.Impl.parse(["-t"])
      {[tasks: true], [], []}

      iex> Timeline.Projects.List.Impl.parse(["--tasks"])
      {[tasks: true], [], []}

  """
  def parse(argv) do
    OptionParser.parse(argv, @opts)
  end

  def decode_response(response, option \\ nil)

  def decode_response({:ok, projects}, :tasks) do
    Formatter.list(projects, :tasks)
  end

  def decode_response({:ok, projects}, _) do
    Formatter.list(projects)
  end

  def decode_response({:error, details}, _) do
    IO.puts("\nerror while fetching: `#{details}`")
  end
end
