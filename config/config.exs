use Mix.Config

import_config "#{Mix.env()}.exs"

config :timeline,
  base_url: ""

config :timeline,
  main_help: """

  Usage: timeline RESOURCE ACTION [OPTIONS]
  Help:  timeline RESOURCE

    RESOURCES   ACTIONS

    entries     add
    projects    list
  """

config :timeline,
  entries_help: """

  Usage: timeline entries ACTION [OPTIONS]

    ACTIONS   OPTIONS             DESCRIPTION

    add       project:task        set the project and its task via two colon-separated strings.
              -a, --amount        set the amount of time, defaults to `8`.
              -e, --executed_on   set a date as YYYY-MM-DD, defaults to today.
              -n, --notes         add a string of notes, defaults to an empty one.
  """

config :timeline,
  entries_add_help: """

  Usage: timeline entries add <project>:<task> [OPTIONS]
  Help:  timeline entries add
  """

config :timeline,
  projects_help: """

  Usage: timeline projects ACTION [OPTIONS]

    ACTIONS   OPTIONS       DESCRIPTION

    list      -t, --tasks   display the project's available tasks.
  """
