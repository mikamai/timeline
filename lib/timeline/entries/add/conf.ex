defmodule Timeline.Entries.Add.Conf do
  @opts [
    aliases: [a: :amount, e: :executed_on, n: :notes],
    strict: [amount: :integer, executed_on: :string, notes: :string]
  ]

  @defaults [amount: :default, executed_on: :default, notes: :default]

  @doc """
  ## Examples

      iex> Timeline.Entries.Add.Conf.parse(~w[-a 8 -e foo -n bar foo:bar])
      {[amount: 8, executed_on: "foo", notes: "bar"], ["foo:bar"], []}

  """
  def parse(argv) do
    OptionParser.parse(argv, @opts)
  end

  @doc """
  ## Examples

      iex> Timeline.Entries.Add.Conf.overwrite_defaults([])
      [amount: :default, executed_on: :default, notes: :default]

      iex> Timeline.Entries.Add.Conf.overwrite_defaults([amount: 8, notes: "foo"])
      [executed_on: :default, amount: 8, notes: "foo"]

      iex> Timeline.Entries.Add.Conf.overwrite_defaults([amount: 8, executed_on: "foo", notes: "bar"])
      [amount: 8, executed_on: "foo", notes: "bar"]

  """
  def overwrite_defaults(parsed) do
    Keyword.merge(@defaults, parsed, fn _, _, parsed_value ->
      parsed_value
    end)
  end

  @doc """
  ## Examples

      iex> Timeline.Entries.Add.Conf.fill_defaults([amount: :default, executed_on: :default, notes: :default])
      [amount: 8, executed_on: Timeline.Entries.Add.Conf.today(), notes: ""]

      iex> Timeline.Entries.Add.Conf.fill_defaults([executed_on: :default, amount: 8, notes: "foo"])
      [executed_on: Timeline.Entries.Add.Conf.today(), amount: 8, notes: "foo"]

      iex> Timeline.Entries.Add.Conf.fill_defaults([amount: 8, executed_on: "foo", notes: "bar"])
      [amount: 8, executed_on: "foo", notes: "bar"]

  """
  def fill_defaults(options) do
    options
    |> update_default(:amount, 8)
    |> update_default(:executed_on, today())
    |> update_default(:notes, "")
  end

  @doc """
  ## Examples

      iex> Timeline.Entries.Add.Conf.split("foo:bar")
      [project: "foo", task: "bar"]

      iex> Timeline.Entries.Add.Conf.split("foo:bar:baz")
      [project: "foo", task: "bar:baz"]
  """
  def split(project_task) do
    values = String.split(project_task, ":", parts: 2)
    Enum.zip([:project, :task], values)
  end

  defp update_default(options, option, new_value) do
    Keyword.update!(options, option, fn curr_value ->
      if curr_value == :default, do: new_value, else: curr_value
    end)
  end

  def today, do: Date.utc_today() |> Date.to_string()
end
