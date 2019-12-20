defmodule Entries.AddTest do
  use ExUnit.Case

  import ExUnit.CaptureIO, only: [capture_io: 1]
  import Timeline, only: [main: 1]

  describe "add entries with valid options" do
    @cmd ~w(entries add cdl-praticanti:programming -a 8)
    test "displays the added entry with minimum set of options" do
      assert capture_io(fn -> main(@cmd) end) =~ "\"task\":\"programming\""
    end

    @cmd ~w(entries add cdl-praticanti:programming -n foo -a 4)
    test "displays the added entry with the notes option" do
      assert capture_io(fn -> main(@cmd) end) =~ "\"notes\":\"foo\""
    end

    @cmd ~w(entries add cdl-praticanti:programming -e 10-10-10 -a 4)
    test "displays the added entry with the date option" do
      assert capture_io(fn -> main(@cmd) end) =~ "\"executed_on\":\"10-10-10\""
    end
  end

  describe "add entries with invalid options" do
    @cmd ~w(entries add cdl-praticanti -a 8)

    test "displays help when missing task" do
      assert capture_io(fn -> main(@cmd) end) =~ "Usage"
    end
  end
end
