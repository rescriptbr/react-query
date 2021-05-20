type queryClient

include ReactQuery_Query
include ReactQuery_Utils

module Provider = {
  @new @module("react-query")
  external createClient: unit => queryClient = "QueryClient"

  @module("react-query") @react.component
  external make: (~client: queryClient, ~children: React.element) => React.element =
    "QueryClientProvider"
}
