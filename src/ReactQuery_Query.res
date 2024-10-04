type queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> = {
  queryKey?: array<'queryKey>,
  queryFn?: ReactQuery_Types.queryFunctionContext<array<'queryKey>, 'pageParam> => Js.Promise.t<
    'queryData,
  >,
  enabled?: bool,
  retry?: ReactQuery_Types.retryValue<'queryError>,
  retryOnMount?: bool,
  retryDelay?: ReactQuery_Types.retryDelayValue<'queryError>,
  staleTime?: ReactQuery_Types.timeValue,
  queryKeyHashFn?: array<'queryKey> => string,
  refetchInterval?: 'queryData => ReactQuery_Types.refetchIntervalValue,
  refetchIntervalInBackground?: bool,
  refetchOnMount?: ReactQuery_Types.boolOrAlwaysValue,
  refetchOnWindowFocus?: ReactQuery_Types.boolOrAlwaysValue,
  refetchOnReconnect?: ReactQuery_Types.boolOrAlwaysValue,
  notifyOnChangeProps?: ReactQuery_Types.notifyOnChangePropsValue,
  notifyOnChangePropsExclusions?: array<string>,
  onSuccess?: 'queryData => unit,
  onError?: 'queryError => unit,
  onSettled?: ('queryData, 'queryError) => unit,
  select?: 'queryData => 'queryData,
  suspense?: bool,
  structuralSharing?: bool,
  useErrorBoundary?: bool,
  initialData?: 'queryData => 'queryData,
  initialDataUpdatedAt?: unit => int,
  placeholderData?: unit => 'queryData,
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

@module("@tanstack/react-query")
external useQuery: queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> => queryResult<
  'queryError,
  'queryData,
> = "useQuery"

type queriesOptions<'queryKey, 'queryData, 'queryError, 'pageParam> = {
  queries: array<queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam>>,
}

@module("@tanstack/react-query")
external keepPreviousData: 'queryData = "keepPreviousData"

@module("@tanstack/react-query")
external useQueries: queriesOptions<'queryKey, 'queryData, 'queryError, 'pageParam> => array<
  queryResult<'queryError, 'queryData>,
> = "useQueries"
