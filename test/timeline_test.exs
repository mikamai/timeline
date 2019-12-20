defmodule TimelineTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO, only: [capture_io: 1]
  import Timeline, only: [main: 1]

  #
  # MAIN
  #

  describe "for the main program" do
    @help Application.get_env(:timeline, :main_help)

    test "displays help if args are not recognized" do
      for args <- [~w[foo bar], ~w[foo entries], ~w[help foo]] do
        assert capture_io(fn -> main(args) end) == @help
      end
    end

    test "displays help if args are not given" do
      assert capture_io(fn -> main([]) end) == @help
    end
  end

  #
  # ENTRIES
  #

  describe "for the entries resource" do
    @resource "entries"
    @help Application.get_env(:timeline, :entries_help)

    test "displays help if args are not recognized" do
      for args <- [[@resource, "foo"], [@resource, "help"]] do
        assert capture_io(fn -> main(args) end) == @help
      end
    end

    test "displays help if args are not given" do
      assert capture_io(fn -> main([@resource]) end) == @help
    end
  end

  #
  # PROJECTS
  #

  describe "for the projects resource" do
    @resource "projects"
    @help Application.get_env(:timeline, :projects_help)

    test "displays help if args are not recognized" do
      for args <- [[@resource, "foo"], [@resource, "help"]] do
        assert capture_io(fn -> main(args) end) == @help
      end
    end

    test "displays help if args are not given" do
      assert capture_io(fn -> main([@resource]) end) == @help
    end
  end
end
