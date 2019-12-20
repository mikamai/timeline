defmodule Entries.AddTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO, only: [capture_io: 1]
  import Timeline, only: [main: 1]

  describe "add entries with valid options" do
    @cmd ~w[entries add foo:bar]
    test "displays the added entry with minimum set of options" do
      assert capture_io(fn -> main(@cmd) end) =~ "\"task\":\"bar\""
    end

    @cmd ~w[entries add foo:bar -n baz]
    test "displays the added entry with the notes option" do
      assert capture_io(fn -> main(@cmd) end) =~ "\"notes\":\"baz\""
    end

    @cmd ~w[entries add foo:bar -e baz]
    test "displays the added entry with the date option" do
      assert capture_io(fn -> main(@cmd) end) =~ "\"executed_on\":\"baz\""
    end

    @cmd ~w[entries add foo:bar --amount=4]
    test "displays the added entry with the amount option" do
      assert capture_io(fn -> main(@cmd) end) =~ "\"amount\":4"
    end
  end

  describe "add entries with invalid options" do
    @cmd ~w[entries add foo -a 8]
    test "displays help when missing task" do
      assert capture_io(fn -> main(@cmd) end) =~ "Usage"
    end

    @cmd ~w[entries add]
    test "displays help when missing options" do
      assert capture_io(fn -> main(@cmd) end) =~ "Usage"
    end
  end
end
