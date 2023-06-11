defmodule FriouardleWeb.Helpers.GameHelper do
  def case_color(:green), do: "bg-green-400"
  def case_color(:yellow), do: "bg-yellow-400"
  def case_color(:red), do: "bg-red-500"
  def case_color(_), do: ""
end
