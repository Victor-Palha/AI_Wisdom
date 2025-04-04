defmodule AiWisdom.TestsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AiWisdom.Tests` context.
  """

  @doc """
  Generate a test.
  """
  def test_fixture(attrs \\ %{}) do
    {:ok, test} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> AiWisdom.Tests.create_test()

    test
  end
end
