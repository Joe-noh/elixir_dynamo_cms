defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn = conn.fetch([:cookies, :params])
    conn.assign(:layout, "main")
  end

  # It is common to break your Dynamo into many
  # routers, forwarding the requests between them:
  # forward "/posts", to: PostsRouter

  get "/" do
    render conn, "index.html"
  end

  get "/articles/:year/:month/:day/:title" do
    year  = Binary.Dict.get(conn.params, :year)
    month = Binary.Dict.get(conn.params, :month)
    day   = Binary.Dict.get(conn.params, :day)
    title = Binary.Dict.get(conn.params, :title)

    render_markdown(conn, year, month, day, title)
  end

  defp render_markdown(conn, year, month, day, title) do
    decoded_title = URI.decode(title)
    filepath = URI.decode(Path.join(["articles", year, month, day, decoded_title]) <> ".md")
    case File.read(filepath) do
      {:ok, content} ->
        conn = conn.assign(:title, decoded_title)
        conn = conn.assign(:body, Markdown.to_html(content, tables: true))
        render conn, "article.html"
      {:error, _} ->
        conn = conn.assign(:code, 404)
        render conn, "error.html"
    end
  end
end
