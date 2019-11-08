defmodule Projects.ListTest do
  use ExUnit.Case

  import ExUnit.CaptureIO, only: [capture_io: 1]
  import Timeline, only: [main: 1]

  describe "list action without options" do
    @fixture """
    Finreach
    Gabetti
    """

    @cmd ~w(projects list)
    test "displays projects" do
      assert capture_io(fn -> main(@cmd) end) == @fixture
    end
  end

  describe "list action with tasks" do
    @fixture """
    Finreach#tasks
    Gabetti#tasks
    """

    @cmd ~w(projects list --tasks)
    test "displays projects and tasks" do
      assert capture_io(fn -> main(@cmd) end) == @fixture
    end

    @cmd ~w(projects list -t)
    test "displays projects and tasks via shortcut" do
      assert capture_io(fn -> main(@cmd) end) == @fixture
    end
  end

  describe "help message" do
    @help Application.get_env(:timeline, :projects_help)

    @cmd ~w(projects list foo)
    test "is called when passed invalid options" do
      assert capture_io(fn -> main(@cmd) end) == @help
    end

    @cmd ~w(projects list --help)
    test "is called via option" do
      assert capture_io(fn -> main(@cmd) end) == @help
    end

    @cmd ~w(projects list -h)
    test "is called via shortcut" do
      assert capture_io(fn -> main(@cmd) end) == @help
    end

    @cmd ~w(projects list -h -t)
    test "is called via mixed options" do
      assert capture_io(fn -> main(@cmd) end) == @help
    end

    @cmd ~w(projects list -h foo)
    test "is called via option and invalid arguments" do
      assert capture_io(fn -> main(@cmd) end) == @help
    end

    @cmd ~w(projects list -t foo)
    test "is called via tasks option and invalid arguments" do
      assert capture_io(fn -> main(@cmd) end) == @help
    end
  end
end