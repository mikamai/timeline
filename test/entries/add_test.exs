defmodule Entries.AddTest do
  use ExUnit.Case

  import ExUnit.CaptureIO, only: [capture_io: 1]
  import Timeline, only: [main: 1]

  describe "add entries with valid arguments" do
    @cmd ~w(entries add cdl-praticanti:programming -a 8)

    test "displays the added entry" do
      assert capture_io(fn -> main(@cmd) end) =~ "\"task\":\"programming\""
    end
  end

  describe "add entries with invalid arguments" do
    @cmd ~w(entries add cdl-praticanti -a 8)

    test "displays help when missing task" do
      assert capture_io(fn -> main(@cmd) end) =~ "Usage"
    end
  end
end
