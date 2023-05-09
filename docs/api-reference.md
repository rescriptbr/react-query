# API Reference
---
- [`Provider.createClient()`](#providercreateclient)
- [`Provider.make()`](#providermake)
- [`DevTools.make(...)`](#devtoolsmake)
- [`useQueryClient`](#usequeryclient)
- [`useQuery`](#usequery)
- [`useMutation`](#usemutation)


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


### `useMutation`

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
