# API Reference

---

- [`Provider.createClient()`](#providercreateclient)
- [`Provider.make()`](#providermake)
- [`DevTools.make(...)`](#devtoolsmake)
- [`useQueryClient`](#usequeryclient)
- [`queryClient`](#queryclient)
- [`useQuery`](#usequery)
- [`queryOptions`](#queryoptions)
- [`useMutation`](#usemutation)
- [`mutationOptions`](#mutationoptions)

### `Provider.createClient()`

The function responsible to create the query client

Definition:

```rescript
  module Provider = {
    let createClient: unit => queryClientValue
  }
```

Usage:

```rescript
  let client = Provider.createClient()
```

### `Provider.make()`

The React Context Provider responsible to hold all the react-query context

Definition:

```rescript
  module Provider = {
    let make: (
      ~client: queryClientValue,
      ~contextSharing: bool=?,
      ~children: React.element
    ) => React.element
  }
```

Usage:

```rescript
  <Provider client={client}>children</Provider>
```

### `DevTools.make(...)`

The React Query DevTools Provider, which is responsible to initialize the React Query devtools

Definition:

```rescript
  module DevTools = {
    let make: (~initialIsOpen: bool=?) => React.element
  }
```

Usage:

```rescript
  <DevTools initialIsOpen={true} />
```

### `useQueryClient()`

The queryClient fetched from a hook

Definition:

```rescript
  let useQueryClient: unit => queryClient<'queryKey, 'queryData, 'queryError, 'pageParams>
```

Usage:

```rescript
  let queryClient = useQueryClient()
```

### `queryClient`

Type responsible for the return of the useQueryClient hook

Definition:

```rescript
  type queryClient<'queryKey, 'queryData, 'queryError, 'pageParams> = {
    fetchQuery: fetchQueryOptions<'queryKey, 'queryData, 'queryError, 'pageParams> => Js.Promise.t<
      'queryData,
    >,
    fetchInfiniteQuery: fetchQueryOptions<
      'queryKey,
      'queryData,
      'queryError,
      'pageParams,
    > => Js.Promise.t<ReactQuery_Types.infiniteData<'queryData>>,
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
    clear: unit => unit,
  }
```

Usage:

```rescript
  let queryClient = useQueryClient()
  queryClient.fetchQuery({queryKey: ["articles"], retryOnMount: true})
```

### `useQuery`

The hook responsible to get loading, error, and data when fetching data from an api

Definition:

```rescript
  let useQuery: queryOptions<'queryKey, 'queryData, 'queryError, 'pageParam> => queryResult<
    'queryError,
    'queryData,
  >
```

Usage:

```rescript
  let queryResult = useQuery({
    queryKey: ["articles"],
    queryFn: () => fetchArticles()
  })
```

### `queryOptions`

Type responsible for hold parameters for the useQuery hook

Definition:

```rescript
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
    keepPreviousData?: bool,
    structuralSharing?: bool,
    useErrorBoundary?: bool,
    initialData?: 'queryData => 'queryData,
    initialDataUpdatedAt?: unit => int,
    placeholderData?: unit => 'queryData,
  }
```

Usage:

```rescript
  let queryOptions = {
    queryKey: ["articles"],
    queryFn: () => fetchArticles()
  }
  let queryResult = useQuery(queryOptions)

```

### `useMutation`

The hook responsible to mutate a query, when update/create/delete anything

Definition:

```rescript
  let useMutation: mutationOptions<
    'mutationVariables,
    'mutationData,
    'mutationError,
    'unknown,
  > => mutationResult<'mutationVariables, 'mutationData, 'mutationError, 'unknown>
```

Usage:

```rescript
  let mutationResult = useMutation({
    mutationKey: ["articles"],
    mutationFn: () => addArticle(article)
  })
```

### `mutationOptions`

Type responsible for hold the parameters for the useMutation hook

Definition:

```rescript
  type mutationOptions<'mutationVariables, 'mutationData, 'mutationError, 'unknown> = {
    mutationKey: array<string>,
    mutationFn: 'mutationVariables => Js.Promise.t<'mutationData>,
    onMutate?: 'mutationVariables => Js.Promise.t<mutationContext>,
    onSuccess?: (
      'mutationData,
      'mutationVariables,
      Js.Nullable.t<mutationContext>,
    ) => Js.Promise.t<'unknown>,
    onError?: (
      'mutationError,
      'mutationVariables,
      Js.Nullable.t<mutationContext>,
    ) => Js.Promise.t<'unknown>,
    onSettled?: (
      'mutationData,
      'mutationError,
      'mutationVariables,
      Js.Nullable.t<mutationContext>,
    ) => Js.Promise.t<'unknown>,
    retry?: ReactQuery_Types.retryValue<'mutationError>,
    retryDelay?: ReactQuery_Types.retryDelayValue<'mutationError>,
    useErrorBoundary?: bool,
  }
```

Usage:

```rescript
  let mutationOptions = {
    mutationKey: ["articles"],
    mutationFn: () => addArticle(article)
  }

  let mutationResult = useMutation(mutationOptions)
```
