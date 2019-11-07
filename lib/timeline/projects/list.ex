defmodule Timeline.Projects.List do
  def run(args) do
    parse_args(args)
  end

  def parse_args(args) do
    parsed =
      OptionParser.parse(
        args,
        aliases: [
          p: :project
        ],
        strict: [
          project: :integer
        ]
      )

    IO.inspect(parsed)
  end
end
