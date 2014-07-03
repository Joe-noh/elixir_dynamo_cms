defmodule ElixirDynamoCms.FilepathHelper do
  use Dynamo.Router

  def filepath2urlpath(filepath) do
    "/" <> cut_md(filepath)
  end

  def extract_title(filepath) do
    List.last(String.split cut_md(filepath), "/")
  end

  defp cut_md(filepath) do
    String.replace(filepath, ~r/\.md$/, "")
  end
end
