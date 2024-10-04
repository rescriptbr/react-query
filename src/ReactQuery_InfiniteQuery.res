type inifiniteQueryFunctionContext<'queryKey> = {
  queryKey: 'queryKey,
  pageParam: option<int>,
}

type infiniteQueryOptions<'queryKey, 'queryData, 'queryError> = {
  queryKey?: 'queryKey,
  queryFn?: inifiniteQueryFunctionContext<'queryKey> => Js.Promise.t<'queryData>,
  enabled?: bool,
  retry?: ReactQuery_Types.retryValue<'queryError>,
  retryOnMount?: bool,
  initialPageParam?: int,
  retryDelay?: ReactQuery_Types.retryDelayValue<'queryError>,
  staleTime?: ReactQuery_Types.timeValue,
  queryKeyHashFn?: 'queryKey => string,
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
  keepPreviousData?: bool,
  structuralSharing?: bool,
  useErrorBoundary?: bool,
  initialData?: 'queryData => 'queryData,
  initialDataUpdatedAt?: unit => int,
  placeholderData?: unit => 'queryData,
  getNextPageParam?: 'queryData => option<int>,
  getPreviousPageParam?: 'queryData => option<int>,
}

type rec infiniteQueryResult<'queryError, 'queryData> = {
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
  dataUpdatedAt: int,
  error: Js.Nullable.t<'queryError>,
  errorUpdatedAt: int,
  failureCount: int,
  refetch: ReactQuery_Types.refetchOptions => Js.Promise.t<
    infiniteQueryResult<'queryError, 'queryData>,
  >,
  remove: unit => unit,
  data: option<ReactQuery_Types.infiniteData<'queryData>>,
  isFetchingNextPage: bool,
  isFetchingPreviousPage: bool,
  fetchNextPage: unit => unit,
  //fetchPreviousPage: (options?: FetchPreviousPageOptions) => Promise<UseInfiniteQueryResult>
  hasNextPage: bool,
  hasPreviousPage: bool,
}

@module("@tanstack/react-query")
external useInfiniteQuery: infiniteQueryOptions<
  'queryKey,
  'queryData,
  'queryError,
> => infiniteQueryResult<'queryError, 'queryData> = "useInfiniteQuery"
