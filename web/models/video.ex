defmodule Rumbl.Video do
  use Rumbl.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :description, :category_id]) //NEED TO ADD CATEGORY ID HERE TO BE ABLE TO SAVE TO DB. NOT MENTIONED IN BOOK
    |> validate_required([:url, :title, :description, :category_id])
    |> assoc_constraint(:category)
  end
end