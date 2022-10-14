include ReactQuery_InfiniteQuery
include ReactQuery_Query
include ReactQuery_Mutation
include ReactQuery_Hooks
include ReactQuery_Utils
include ReactQuery_Client
module DevTools = {
  @react.component @module("@tanstack/react-query-devtools")
  external make: (~initialIsOpen: bool=?) => React.element = "ReactQueryDevtools"
}
