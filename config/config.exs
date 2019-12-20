use Mix.Config

import_config "#{Mix.env()}.exs"

config :timeline,
  base_url: ""

config :timeline,
  main_help: """

  Usage: timeline RESOURCE ACTION [OPTIONS]
  Help:  timeline RESOURCE

  RESOURCES | ACTIONS
  ----------+------------
  entries   | add, list
  ----------+------------
  projects  | alias, list
  """

config :timeline,
  entries_help: """

  Usage: timeline entries ACTION [OPTIONS]
  Help:  timeline entries ACTION

  ACTIONS | OPTIONS      | DESCRIPTION
  --------+--------------+-------------------------------------------------
  add     | -d, --date   | specify a date as YYYY-MM-DD, defaults to today.
          | -n, --notes  | add notes as a string, defaults to an empty one.
          | -a, --amount | set the amount of time, this option is required.
  """

config :timeline,
  projects_help: """

  Usage: timeline projects ACTION [OPTIONS]

  ACTIONS | OPTIONS     | DESCRIPTION
  --------+-------------+---------------------------------------
  list    | -t, --tasks | display the project's available tasks.
  """
