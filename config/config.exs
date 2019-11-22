use Mix.Config

import_config "#{Mix.env()}.exs"

config :timeline,
  base_url: "https://bd1da57d-487f-474a-b53e-0161e0a2d52b.mock.pstmn.io/api/v1"

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
  Help:  timeline projects ACTION

  ACTIONS | OPTIONS      | DESCRIPTION
  --------+--------------+------------------------------------------------
  add     | -d, --date   | specify a date as YYYY-MM-DD, defaults to today
          | -n, --notes  | add notes as a string, defaults to an empty one
          | -a, --amount | set the amount of time, this option is required
  """

config :timeline,
  projects_help: """

  Usage: timeline projects ACTION [OPTIONS]
  Help:  timeline projects ACTION

  ACTIONS | OPTIONS     | DESCRIPTION
  --------+-------------+----------------------------
  list    | -t, --tasks | display the project's tasks
  """
