defmodule Timeline.Projects.Alias do
  def run(args) do
    store_alias(args)
  end

  def store_alias(args) do
    [name | value] = args

    IO.inspect("#{name} will be set to #{value}")
  end
end
