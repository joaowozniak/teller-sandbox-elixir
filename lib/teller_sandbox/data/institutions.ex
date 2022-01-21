defmodule TellerSandbox.Data.Institutions do
  alias TellerSandbox.Randomizer.Id

  @names ["Chase", "Bank of America", "Wells Fargo", "Citibank", "Capital One"]

  @all_institutions Enum.map(@names, fn name ->
                      %{
                        id: name |> String.replace(" ", "_") |> String.downcase(),
                        name: name
                      }
                    end)

  def get_inst(token) do
    Enum.at(
      @all_institutions,
      Integer.mod(Id.get_numeric(token), length(@names))
    )
  end
end
