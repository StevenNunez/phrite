defmodule PhriteWeb.AuthoringLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div id="authoring">
      <textarea phx-keyup='press'></textarea>
    </div>
    <div id="preview">
      <%= @markup %>
    </div>
    """
  end

  def mount(session, socket) do
    with {:ok, markup} <- convert_to_markup("# Type something in the box") do
      {:ok, assign(socket, :markup, markup)}
    end
  end

  def handle_event("press", body, socket) do
    case convert_to_markup(body) do
      {:ok, markup} ->
        {:noreply, assign(socket, :markup, markup)}

      :error ->
        {:noreply, socket}
    end
  end

  defp convert_to_markup(markdown) do
    case markdown |> Earmark.as_html() do
      {:ok, body, []} -> {:ok, Phoenix.HTML.raw(body)}
      {:error, _, _} -> :error
    end
  end
end
