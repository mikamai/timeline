defmodule Timeline.Entries.Add do
  @options [
    aliases: [d: :date, n: :notes, a: :amount],
    strict: [date: :string, notes: :string, amount: :integer]
  ]
  @keys ~w(executed_on notes amount project task)a

  def run(args) do
    args
    |> parse_args()
    |> process()
  end

  def parse_args(args) do
    parsed = OptionParser.parse(args, @options)
    IO.inspect(parsed, label: "args")

    case parsed do
      {[amount: amount], [project_task], []} ->
        [:default, :default, amount] ++ split(project_task)

      {[date: date, amount: amount], [project_task], []} ->
        [date, :default, amount] ++ split(project_task)

      {[date: date, note: note, amount: amount], [project_task], []} ->
        [date, note, amount] ++ split(project_task)

      # need a better :default handling
      # shortcut the processing of the date if matches Regex
      # generate as many body with different dates and process requests for each of them

      _ ->
        :help
    end
  end

  def process(values) when length(values) < 5 do
    IO.puts("Usage: timeline entries add <project>:<task> [OPTIONS]")
  end

  def process([:default, :default | values] = _) do
    values = [today(), "" | values]

    bodify(values)
    |> IO.puts()
  end

  def process([date, :default | values] = _) do
    values = [date, "" | values]

    bodify(values)
    |> IO.puts()
  end

  def process(:help) do
    Helper.display_help_for("entries")
  end

  def process(values) do
    IO.inspect(values, label: "values")

    # bodify(values)
    # |> IO.puts()
  end

  defp split(project_task) do
    project_task = String.split(project_task, ":")

    case length(project_task) do
      2 ->
        project_task

      _ ->
        [:error]
    end
  end

  defp bodify(values, keys \\ @keys) do
    encoded =
      [keys, values]
      |> List.zip()
      |> Enum.into(%{})
      |> Jason.encode()

    case encoded do
      {:ok, body} ->
        body

      _ ->
        IO.puts("Usage: timeline entries add <project>:<task> [OPTIONS]")
    end
  end

  defp today do
    Date.utc_today()
    |> Date.to_string()
  end
end
