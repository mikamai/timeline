defmodule Timeline.Entries.List do
  def run(args) do
    parse_args(args)
  end

  def parse_args(args) do
    parsed =
      OptionParser.parse(
        args,
        aliases: [
          e: :entry
        ],
        strict: [
          entry: :integer
        ]
      )

    IO.inspect(parsed)
  end
end
