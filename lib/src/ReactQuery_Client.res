type queryClientValue
type fetchMeta

type notifyOnChangePropsKeys = [
  | #error
  | #isError
  | #isIdle
  | #isLoading
  | #isLoadingError
  | #isRefetchError
  | #isSuccess
  | #status
  | #tracked
]

type infiniteQueryObserverResultProps = [
  | #error
  | #isError
  | #isIdle
  | #isLoading
  | #isLoadingError
  | #isRefetchError
  | #isSuccess
  | #status
  | #tracked
]

type fetchContext

type queryBehavior = {onFetch: fetchContext => unit}

type getPreviousPageParamFunction<'data> = {
  firstPage: 'data,
  allPages: array<'data>,
}

type getNextPageParamFunction<'data> = {
  lastPage: 'data,
  allPages: array<'data>,
}

@deriving(abstract)
type queryObserverOptions<'error, 'data, 'queryData, 'queryKey, 'pageParam> = {
  @optional retry: ReactQuery_Types.retryValue<'error>,
  @optional retryDelay: ReactQuery_Types.retryValue<'error>,
  @optional cacheTime: int,
  @optional isDataEqual: (option<'data>, 'data) => bool,
  @optional
  queryFn: ReactQuery_Types.queryFunctionContext<'queryKey, 'pageParam> => Js.Promise.t<'queryData>,
  @optional queryHash: string,
  @optional queryKey: 'queryKey,
  @optional queryKeyHashFn: 'queryKey => string,
  @optional initialData: unit => 'data,
  @optional initialDataUpdatedAt: unit => option<int>,
  @optional behavior: queryBehavior, // Revisar context type
  @optional structuralSharing: bool,
  @optional getPreviousPageParam: getPreviousPageParamFunction<'data>,
  @optional getNextPageParam: getNextPageParamFunction<'data>,
  @optional _defaulted: bool,
  @optional enabled: bool,
  @optional staleTime: int,
  @optional refetchInterval: ReactQuery_Types.refetchIntervalValue,
  @optional refetchIntervalInBackground: bool,
  @optional refetchOnWindowFocus: ReactQuery_Types.boolOrAlwaysValue,
  @optional refetchOnReconnect: ReactQuery_Types.boolOrAlwaysValue,
  @optional refetchOnMount: ReactQuery_Types.boolOrAlwaysValue,
  @optional retryOnMount: bool,
  @optional notifyOnChangeProps: array<notifyOnChangePropsKeys>,
  @optional notifyOnChangePropsExclusions: array<bool>,
  @optional onSuccess: 'data => unit,
  @optional onError: 'error => unit,
  @optional onSettled: (option<'data>, option<'error>) => unit,
  @optional useErrorBoundary: bool,
  @optional select: 'queryData => 'data,
  @optional suspense: bool,
  @optional keepPreviousData: bool,
  @optional placeholderData: ReactQuery_Types.placeholderDataValue,
  @optional optimisticResults: bool,
}

type defaultOptions<'error, 'data, 'queryData, 'queryKey, 'pageParam> = {
  queries: option<queryObserverOptions<'error, 'data, 'queryData, 'queryKey, 'pageParam>>,
}

type invalidateQueryFilter = {
  refetchActive: option<bool>,
  refetchInactive: option<bool>,
}

type clientRefetchOptions = {throwOnError: option<bool>}

type invalidateQueryOptions<'queryKey> = {
  queryKey: option<'queryKey>,
  filters: option<invalidateQueryFilter>,
  refetchOptions: option<clientRefetchOptions>,
}

type refetchQueriesOptions<'queryKey> = {
  queryKey: option<'queryKey>,
  filters: option<ReactQuery_Types.queryFilter<'queryKey>>,
  refetchOptions: option<clientRefetchOptions>,
}

type cancelQueriesOptions<'queryKey> = {
  queryKey: option<'queryKey>,
  filters: option<ReactQuery_Types.queryFilter<'queryKey>>,
}

type queryState<'queryData, 'queryError> = {
  data: option<'queryData>,
  dataUpdateCount: int,
  dataUpdatedAt: int,
  error: Js.Nullable.t<'queryError>,
  errorUpdateCount: int,
  errorUpdatedAt: int,
  fetchFailureCount: int,
  fetchMeta: fetchMeta,
  isFetching: bool,
  isInvalidated: bool,
  isPaused: bool,
  status: ReactQuery_Types.queryStatus,
}

@deriving(abstract)
type fetchQueryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> = {
  @optional queryKey: 'queryKey,
  @optional
  queryFn: ReactQuery_Types.queryFunctionContext<'queryKey, 'pageParam> => Js.Promise.t<'queryData>,
  @optional retry: ReactQuery_Types.retryValue<'queryError>,
  @optional retryOnMount: bool,
  @optional retryDelay: ReactQuery_Types.retryDelayValue<'queryError>,
  @optional staleTime: ReactQuery_Types.timeValue,
  @optional queryKeyHashFn: 'queryKey => string,
  @optional refetchOnMount: ReactQuery_Types.boolOrAlwaysValue,
  @optional structuralSharing: bool,
  @optional initialData: 'queryData => 'queryData,
  @optional initialDataUpdatedAt: unit => int,
}

type queryClient<'queryKey, 'queryData, 'queryError, 'pageParams> = {
  fetchQuery: fetchQueryOptions<'queryKey, 'queryData, 'queryError, 'pageParams> => Js.Promise.t<
    'queryData,
  >,
  fetchInfiniteQuery: fetchQueryOptions<
    'queryKey,
    'queryData,
    'queryError,
    'pageParams,
  > => Js.Promise.t<ReactQuery_Types.infiniteData<'queryData, 'pageParams>>,
  prefetchQuery: fetchQueryOptions<'queryKey, 'queryData, 'queryError, 'pageParams> => Js.Promise.t<
    unit,
  >,
  prefetchInfiniteQuery: fetchQueryOptions<
    'queryKey,
    'queryData,
    'queryError,
    'pageParams,
  > => Js.Promise.t<unit>,
  getQueryData: 'queryKey => option<'queryData>,
  setQueryData: ('queryKey, option<'queryData>) => 'queryData,
  getQueryState: (
    'queryKey,
    ReactQuery_Types.queryFilter<'queryKey>,
  ) => queryState<'queryData, 'queryError>,
  setQueriesData: (
    ReactQuery_Types.queryDataKeyOrFilterValue<'queryKey>,
    option<'queryData> => 'queryData,
  ) => unit,
  invalidateQueries: (
    option<ReactQuery_Types.queryFilter<'queryKey>>,
    option<clientRefetchOptions>,
  ) => Js.Promise.t<unit>,
  refetchQueries: (
    option<ReactQuery_Types.queryFilter<'queryKey>>,
    option<clientRefetchOptions>,
  ) => Js.Promise.t<unit>,
  cancelQueries: option<ReactQuery_Types.queryFilter<'queryKey>> => Js.Promise.t<unit>,
  removeQueries: option<ReactQuery_Types.queryFilter<'queryKey>> => Js.Promise.t<unit>,
  resetQueries: (
    option<ReactQuery_Types.queryFilter<'queryKey>>,
    option<clientRefetchOptions>,
  ) => Js.Promise.t<unit>,
  isFetching: option<ReactQuery_Types.queryFilter<'queryKey>> => bool,
  isMutating: option<ReactQuery_Types.queryFilter<'queryKey>> => bool,
  // setDefaultOptions
  // getDefaultOptions
  // setQueryDefaults
  // getQueryDefaults
  // getQueryCache
  // setQueryCache
  // getMutationCache
  // setMutationCache
  clear: unit => unit,
}

@module("react-query")
external useQueryClient: unit => queryClient<'queryKey, 'queryData, 'queryError, 'pageParams> =
  "useQueryClient"

module Provider = {
  @new @module("react-query")
  external createClient: unit => queryClientValue = "QueryClient"

  @module("react-query") @react.component
  external make: (
    ~client: queryClientValue,
    ~contextSharing: bool=?,
    ~children: React.element,
  ) => React.element = "QueryClientProvider"
}
