type queryFunctionContext
type queryKey

type timeValue
type boolOrAlwaysValue
type refetchIntervalValue
type notifyOnChangePropsValue
type retryValue<'queryError>
type retryDelayValue<'queryError>

type retryParam<'queryError> = [#bool(bool) | #number(int) | #fn((int, 'queryError) => bool)]
type retryDelayParam<'queryError> = [#number(int) | #fn((int, 'queryError) => int)]
type time = [#number(int) | #infinity]
type refetchInterval = [#bool(bool) | #number(int)]
type boolOrAlways = [#bool(bool) | #always]
type notifyOnChangeProps = [#array(array<string>) | #tracked]

type queryStatus = [#loading | #success | #idle | #error | #initialData]

type refetchOptions = {
  throwOnError: bool,
  cancelRefetch: bool,
}

@deriving(abstract)
type queryOptions<'queryKey, 'queryData, 'queryError> = {
  @optional queryKey: 'queryKey,
  @optional queryFn: queryFunctionContext => Js.Promise.t<'queryData>,
  @optional enabled: bool,
  @optional retry: retryValue<'queryError>,
  @optional retryOnMount: bool,
  @optional retryDelay: retryDelayValue<'queryError>,
  @optional staleTime: timeValue,
  @optional queryKeyHashFn: queryKey => string,
  @optional refetchInterval: refetchIntervalValue,
  @optional refetchIntervalInBackground: bool,
  @optional refetchOnMount: boolOrAlwaysValue,
  @optional refetchOnWindowFocus: boolOrAlwaysValue,
  @optional refetchOnReconnect: boolOrAlwaysValue,
  @optional notifyOnChangeProps: notifyOnChangePropsValue,
  @optional notifyOnChangePropsExclusions: array<string>,
  @optional onSuccess: 'queryData => unit,
  @optional onError: 'queryError => unit,
  @optional onSettled: ('queryData, 'queryError) => unit,
  @optional select: 'queryData => 'queryData,
  @optional suspense: bool,
  @optional keepPreviousData: bool,
  @optional structuralSharing: bool,
  @optional useErrorBoundary: bool,
  @optional initialData: 'queryData => 'queryData,
  @optional initialDataUpdatedAt: unit => int,
  @optional placeholderData: unit => 'queryData,
}

type rec queryResult<'queryError, 'queryData> = {
  status: queryStatus,
  isIdle: bool,
  isError: bool,
  isFetched: bool,
  isFetchedAfterMount: bool,
  isFetching: bool,
  isLoading: bool,
  isLoadingError: bool,
  isPlaceholderData: bool,
  isPreviousData: bool,
  isRefetchError: bool,
  isStale: bool,
  isSuccess: bool,
  data: option<'queryData>,
  dataUpdatedAt: int,
  error: Js.Nullable.t<'queryError>,
  errorUpdatedAt: int,
  failureCount: int,
  refetch: refetchOptions => Js.Promise.t<queryResult<'queryError, 'queryData>>,
  remove: unit => unit,
}

@module("react-query")
external useQuery: queryOptions<'queryKey, 'queryData, 'queryError> => queryResult<
  'queryError,
  'queryData,
> = "useQuery"

@module("react-query")
external useQueries: array<queryOptions<'queryKey, 'queryData, 'queryError>> => array<
  queryResult<'queryError, 'queryData>,
> = "useQueries"
