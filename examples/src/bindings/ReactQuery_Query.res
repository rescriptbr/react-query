module Promise = Js.Promise

type selectData
type queryFunctionContext

module type IConfig = {
  type queryKey
  type data
  type error
  type decodeError

  let decoder: Js.Json.t => Belt.Result.t<data, decodeError>
}

module Make = (Config: IConfig) => {
  type queryStatus = [#loading | #success | #idle | #error | #initialData]

  type queryResult =
    | Loading
    | Idle
    | DecodeError(Config.decodeError)
    | Success(Config.data)
    | Error(option<Config.error>)
    | InitialData

  @deriving(abstract)
  type hookConfig = {
    @optional queryKey: Config.queryKey,
    @optional queryFn: queryFunctionContext => Js.Promise.t<Js.Json.t>,
    @optional enabled: bool,
    @optional retryOnMount: bool,
    @optional notifyOnChangePropsExclusions: array<string>,
    @optional onSuccess: Config.data => unit,
    @optional onError: Config.error => unit,
    @optional onSettled: (Config.data, Config.error) => unit,
    @optional select: Config.data => selectData,
    @optional suspense: bool,
    @optional keepPreviousData: bool,
    @optional structuralSharing: bool,
    @optional useErrorBoundary: bool,
    @optional initialData: unit => Config.data,
  }

  type refetchOptions = {
    throwOnError: bool,
    cancelRefetch: bool,
  }

  type objectResult = {
    status: queryStatus,
    data: Js.Json.t,
    dataUpdatedAt: int,
    error: option<Config.error>,
    errorUpdatedAt: int,
    failureCount: int,
    isError: bool,
    isFetched: bool,
    isFetchedAfterMount: bool,
    isFetching: bool,
    isIdle: bool,
    isLoading: bool,
    isLoadingError: bool,
    isPlaceholderData: bool,
    isPreviousData: bool,
    isRefetchError: bool,
    isStale: bool,
    isSuccess: bool,
    refetch: refetchOptions => Promise.t<Config.data>,
    remove: unit => unit,
  }

  type hookResult = (queryResult, objectResult)

  @module("react-query")
  external useQueryJs: (. hookConfig) => objectResult = "useQuery"

  let useQuery = (
    ~queryKey,
    ~queryFn,
    ~initialData=?,
    ~enabled=?,
    ~retryOnMount=?,
    ~notifyOnChangePropsExclusions=?,
    ~onSuccess=?,
    ~onError=?,
    ~onSettled=?,
    ~select=?,
    ~suspense=?,
    ~keepPreviousData=?,
    ~structuralSharing=?,
    ~useErrorBoundary=?,
    (),
  ) => {
    let result = useQueryJs(.
      hookConfig(
        ~queryKey,
        ~queryFn,
        ~initialData?,
        ~enabled?,
        ~retryOnMount?,
        ~notifyOnChangePropsExclusions?,
        ~onSuccess?,
        ~onError?,
        ~onSettled?,
        ~select?,
        ~suspense?,
        ~keepPreviousData?,
        ~structuralSharing?,
        ~useErrorBoundary?,
        (),
      ),
    )

    let queryResult = switch result.status {
    | #success =>
      switch Config.decoder(result.data) {
      | Ok(value) => Success(value)
      | Error(decodeError) => DecodeError(decodeError)
      }
    | #loading => Loading
    | #idle => Idle
    | #error => Error(result.error)
    | #initialData => InitialData
    }

    (queryResult, result)
  }
}
