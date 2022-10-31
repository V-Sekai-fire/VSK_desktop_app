defmodule TodoWeb.Kaffy.Extension do
  def stylesheets(_conn) do
    [
      {:safe, ~s(<link rel="stylesheet" href="/assets/todo_style.css" />)}
    ]
  end

  def javascripts(_conn) do
    [
    ]
  end
end
