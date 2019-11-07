use Mix.Config

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
  """

config :timeline,
  projects_help: """
  Usage: timeline projects ACTION [OPTIONS]
  """
