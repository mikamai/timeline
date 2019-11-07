defmodule Support do
  @main_help Application.get_env(:timeline, :main_help)
  @entries_help Application.get_env(:timeline, :entries_help)
  @projects_help Application.get_env(:timeline, :projects_help)

  def display_main_help do
    IO.write(@main_help)
  end

  def display_help_for("entries") do
    IO.write(@entries_help)
  end

  def display_help_for("projects") do
    IO.write(@projects_help)
  end
end
