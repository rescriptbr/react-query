type inifiniteQueryFunctionContext<'queryKey, 'pageParam> = {
  queryKey: array<'queryKey>,
  pageParam: option<'pageParam>,
}

@deriving(abstract)
type infiniteQueryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> = {
  @optional queryKey: 'queryKey,
  @optional
  queryFn: inifiniteQueryFunctionContext<'queryKey, 'pageParam> => Js.Promise.t<'queryData>,
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
  @optional getNextPageParam: ('pageParam, array<'pageParam>) => option<'pageParam>,
  @optional getPreviousPageParam: ('pageParam, array<'pageParam>) => option<'pageParam>,
}

type rec infiniteQueryResult<'queryError, 'queryData, 'pageParam> = {
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
    infiniteQueryResult<'queryError, 'queryData, 'pageParam>,
  >,
  remove: unit => unit,
  data: ReactQuery_Types.infiniteData<'queryData, 'pageParam>,
  isFetchingNextPage: bool,
  isFetchingPreviousPage: bool,
  //fetchNextPage: (options?: FetchNextPageOptions) => Promise<UseInfiniteQueryResult>
  //fetchPreviousPage: (options?: FetchPreviousPageOptions) => Promise<UseInfiniteQueryResult>
  hasNextPage: bool,
  hasPreviousPage: bool,
}

@module("react-query")
external useQuery: infiniteQueryOptions<
  'queryKey,
  'queryData,
  'queryError,
  'pageParam,
> => infiniteQueryResult<'queryError, 'queryData, 'pageParam> = "useInfiniteQuery"
