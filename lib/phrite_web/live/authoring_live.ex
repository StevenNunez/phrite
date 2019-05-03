defmodule PhriteWeb.AuthoringLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div id="authoring">
    </div>
    <div id="preview">
      <%= @markup %>
    </div>
    """
  end

  def mount(session, socket) do
    {:ok, assign(socket, :markup, Phoenix.HTML.raw("<h1>Working</h1>"))}
  end
end
