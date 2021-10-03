type resetErrorBoundary = {reset: unit => unit}

@module("react-query")
external useIsFetching: unit => bool = "useIsFetching"

@module("react-query") external useIsFetchingWithKeys: 'queryKey => bool = "useIsFetching"

@module("react-query")
external useIsMutating: unit => bool = "useIsMutating"

@module("react-query") external useIsMutatingWithKeys: 'queryKey => bool = "useIsMutating"

@module("react-query")
external useQueryErrorResetBoundary: unit => resetErrorBoundary = "useQueryErrorResetBoundary"
