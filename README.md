<p align="center">
  <img src="./assets/logo.svg" /> 
  <br />
  <br />
  <a target="_blank" href="#installation"> Installation </a> //
    <a target="_blank" href="#getting-started"> Getting Started </a> //
    <a target="_blank" href="#supported-features"> Supported Features </a> //
  <a target="_blank" href="https://github.com/rescriptbr"> ReScript Brazil Community </a>
 </p>

## Installation

Install the package using npm/yarn:

```sh
yarn add @rescriptbr/react-query
```

Add the package to `bs-dependencies` in your `bsconfig.json`:

```json
{
"bs-dependencies": [
  "@rescript/react",
  "@rescriptbr/react-query"
 ]
}

```

## Supported features
These bindings are work in progress, check out the supported features:

- ✅ `=` Fully implemented
- ⬜ `=` Not implemented yet
- ⚙️ `=` Work in progress
- ⚠️ `=` Partially implemented

### Hooks

- ✅ useQuery 
- ✅ useQueries 
- ✅ useMutation 
- ✅ useInfiniteQuery
- ✅ useQueryClient
- ✅ useQueryErrorResetBoundary
- ✅ useIsFetching
- ✅ useIsMutating

### Providers / Client / Core

- ✅ QueryClientProvider
- ⚙️ QueryClient 
- ⚙️ QueryCache
- ⚙️ MutationCache
- ⚙️ QueryObserver
- ⚙️ InfiniteQueryObserver
- ⚙️ QueriesObserver
- ⚙️ QueryErrorResetBoundary

### Functions / Helpers

- ⬜ focusManager
- ⬜ onlineManager
- ⬜ setLogger
- ⬜ hydration/Hydrate
- ⬜ hydration/useHydrate
- ⬜ hydration/hydrate
- ⬜ hydration/dehydrate
