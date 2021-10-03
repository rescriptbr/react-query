@deriving(abstract)
type queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> = {
  @optional queryKey: 'queryKey,
  @optional
  queryFn: ReactQuery_Types.queryFunctionContext<'queryKey, 'pageParam> => Js.Promise.t<'queryData>,
  @optional enabled: bool,
  @optional retry: ReactQuery_Types.retryValue<'queryError>,
  @optional retryOnMount: bool,
  @optional retryDelay: ReactQuery_Types.retryDelayValue<'queryError>,
  @optional staleTime: ReactQuery_Types.timeValue,
  @optional queryKeyHashFn: 'queryKey => string,
  @optional refetchInterval: ReactQuery_Types.refetchIntervalValue,
  @optional refetchIntervalInBackground: bool,
  @optional refetchOnMount: ReactQuery_Types.boolOrAlwaysValue,
  @optional refetchOnWindowFocus: ReactQuery_Types.boolOrAlwaysValue,
  @optional refetchOnReconnect: ReactQuery_Types.boolOrAlwaysValue,
  @optional notifyOnChangeProps: ReactQuery_Types.notifyOnChangePropsValue,
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
  status: ReactQuery_Types.queryStatus,
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
  refetch: ReactQuery_Types.refetchOptions => Js.Promise.t<queryResult<'queryError, 'queryData>>,
  remove: unit => unit,
}

@module("react-query")
external useQuery: queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> => queryResult<
  'queryError,
  'queryData,
> = "useQuery"

@module("react-query")
external useQueries: array<queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam>> => array<
  queryResult<'queryError, 'queryData>,
> = "useQueries"
