Dynamo.under_test(ElixirDynamoCms.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule ElixirDynamoCms.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
