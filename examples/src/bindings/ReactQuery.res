type queryClient

module Query = ReactQuery_Query

module Provider = {
  @new @module("react-query")
  external createClient: unit => queryClient = "QueryClient"

  @module("react-query") @react.component
  external make: (~client: queryClient, ~children: React.element) => React.element =
    "QueryClientProvider"
}
