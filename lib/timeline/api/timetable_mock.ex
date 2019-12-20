defmodule Timeline.API.TimetableMock do
  @moduledoc """
  Mocks the requests to the API.
  """

  def get(_orgs, _resource) do
    {
      :ok,
      [
        %{
          id: "df433226-338f-4f22-8803-c0ae04e45bfc",
          name: "cdl-praticanti",
          organization_id: "114c4ee1-736a-4e09-9bbd-1f93156cd19a",
          slug: "cdl-cdl-praticanti",
          tasks: [
            %{
              id: "995179f0-657e-477a-b5dd-99381068bf46",
              name: "programming",
              slug: "programming"
            },
            %{
              id: "da39642a-c80b-4b37-9468-db7b0c28c86a",
              name: "review",
              slug: "review"
            },
            %{id: "db33e895-e5ab-4333-88a4-d83fe222f48b", name: "prep", slug: "prep"},
            %{
              id: "d57ca82c-bb55-4929-9d06-7468d0285236",
              name: "conference",
              slug: "conference"
            }
          ]
        },
        %{
          id: "67f497b6-5f37-40cf-acdc-510a14792878",
          name: "revest",
          organization_id: "114c4ee1-736a-4e09-9bbd-1f93156cd19a",
          slug: "revest-revest",
          tasks: [
            %{
              id: "995179f0-657e-477a-b5dd-99381068bf46",
              name: "programming",
              slug: "programming"
            },
            %{
              id: "da39642a-c80b-4b37-9468-db7b0c28c86a",
              name: "review",
              slug: "review"
            }
          ]
        }
      ]
    }
  end
end
