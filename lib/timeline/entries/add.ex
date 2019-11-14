defmodule Timeline.Entries.Add do
  @options [
    aliases: [d: :date, n: :notes, a: :amount],
    strict: [date: :string, notes: :string, amount: :integer]
  ]

  def run(args) do
    args
    |> parse_args()
    |> process()
  end

  def parse_args(args) do
    parsed = OptionParser.parse(args, @options)

    case parsed do
      {[amount: amount], [project_task], []} ->
        [:default, :default, amount] ++ split(project_task)

      _ ->
        :help
    end
  end

  def process(values) when length(values) < 5 do
    IO.puts("Usage: timeline entries add <project>:<task> [OPTIONS]")
  end

  def process([:default, :default | values] = _) do
    keys = ~w(executed_on notes amount project task)a
    values = [today(), "" | values]

    bodify([keys, values])
    |> IO.puts()
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

  defp bodify(key_value_pairs) do
    encoded =
      key_value_pairs
      |> List.zip()
      |> Enum.into(%{})
      |> Jason.encode()

    case encoded do
      {:ok, body } ->
        body

      _ ->
        IO.puts("Usage: timeline entries add <project>:<task> [OPTIONS]")
    end
  end

  defp today do
    # YYYY/MM/DD
    Date.utc_today()
    |> Date.to_string()
  end
end
