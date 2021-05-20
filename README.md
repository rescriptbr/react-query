## useQuery(...) ✅

### Result

- [x] `status: String`
- [x] `isIdle: boolean`
- [x] `isLoading: boolean`
- [x] `isSuccess: boolean`
- [x] `isError: boolean`
- [x] `isLoadingError: boolean`
- [x] `isRefetchError: boolean`
- [x] `data: TData`
- [x] `dataUpdatedAt: number`
- [x] `error: null | TError`
- [x] `errorUpdatedAt: number`
- [x] `isStale: boolean`
- [x] `isPlaceholderData: boolean`
- [x] `isPreviousData: boolean`
- [x] `isFetched: boolean`
- [x] `isFetchedAfterMount: boolean`
- [x] `isFetching: boolean`
- [x] `failureCount: number`
- [x] `refetch: (options: { throwOnError: boolean, cancelRefetch: boolean }) => Promise<UseQueryResult>`
- [x] `remove: () => void`

### Options 

- [x] `queryKey: string | unknown[]`
- [x] `queryFn: (context: QueryFunctionContext) => Promise<TData>`
- [x] `enabled: boolean`
- [x] `retry: boolean | number | (failureCount: number, error: TError) => boolean`
- [x] `retryOnMount: boolean`
- [x] `retryDelay: number | (retryAttempt: number, error: TError) => number`
- [x] `staleTime: number | Infinity`
- [x] `cacheTime: number | Infinity`
- [x] `queryKeyHashFn: (queryKey: QueryKey) => string`
- [x] `refetchInterval: false | number`
- [x] `refetchIntervalInBackground: boolean`
- [x] `refetchOnMount: boolean | "always"`
- [x] `refetchOnWindowFocus: boolean | "always"`
- [x] `refetchOnReconnect: boolean | "always"`
- [x] `notifyOnChangeProps: string[] | "tracked"`
- [x] `notifyOnChangePropsExclusions: string[]`
- [x] `onSuccess: (data: TData) => void`
- [x] `onError: (error: TError) => void`
- [x] `onSettled: (data?: TData, error?: TError) => void`
- [x] `select: (data: TData) => unknown`
- [x] `suspense: boolean`
- [x] `initialData: TData | () => TData`
- [x] `initialDataUpdatedAt: number | (() => number | undefined)`
- [x] `placeholderData: TData | () => TData`
- [x] `keepPreviousData: boolean`
- [x] `structuralSharing: boolean`
- [x] `useErrorBoundary: boolean`

## useQueries(...) ✅

## Features

- useQuery ✅
- useQueries ✅
- useInfiniteQuery
- useMutation
- useIsFetching
- useIsMutating
- QueryClient
- QueryClientProvider
- useQueryClient
- QueryCache
- MutationCache
- QueryObserver
- InfiniteQueryObserver
- QueriesObserver
- QueryErrorResetBoundary
- useQueryErrorResetBoundary
- focusManager
- onlineManager
- setLogger
- hydration/Hydrate
- hydration/useHydrate
- hydration/hydrate
- hydration/dehydrate
