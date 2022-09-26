defmodule Todo.Todo do
  @required_keys [:id, :title, :created_at]
  @default_keys [completed?: false]

  @enforce_keys @required_keys
  defstruct @required_keys ++ @default_keys

  def build(title) do
    %__MODULE__{
      id: UUID.uuid4(),
      title: title,
      created_at: DateTime.utc_now()
    }
  end
end
