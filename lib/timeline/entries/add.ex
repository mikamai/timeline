defmodule Timeline.Entries.Add do
  def run(args) do
    parse_args(args)
  end

  def parse_args(args) do
    parsed =
      OptionParser.parse(
        args,
        aliases: [
          d: :date,
          p: :project,
          t: :task,
          n: :notes,
          h: :hours
        ],
        strict: [
          date: :string,
          project: :string,
          task: :string,
          notes: :string,
          hours: :integer
        ]
      )

    IO.inspect(parsed)
  end
end
