defmodule ElixirDynamoCms.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated with this Dynamo
    otp_app: :elixir_dynamo_cms,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from which static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_elixir_dynamo_cms_session",
  #       secret: "tlGPlcAmV/zdMY7luZDtrEmtr0zdD404uGK0EaUq3dF/UAOdLzx/S2T0j//tyhB+"]

  config :article, paths: Path.wildcard("articles/**/*.md")

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
