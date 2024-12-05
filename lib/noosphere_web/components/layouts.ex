defmodule NoosphereWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use NoosphereWeb, :controller` and
  `use NoosphereWeb, :live_view`.
  """
  use NoosphereWeb, :html

  embed_templates "layouts/*"
end
