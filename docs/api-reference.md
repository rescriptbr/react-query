# API Reference
---
- [`ReactQuery.Provider.createClient()`](#reactqueryprovidercreateclient)
- [`ReactQuery.Provider.make()`](#reactqueryprovidermake)


### `ReactQuery.Provider.createClient()`

The function responsible to create the query client

Definition:

```rescript
  module Provider = {
    let createClient: unit => queryClientValue
  }
```
Usage:
```rescript
  let client = ReactQuery.Provider.createClient()
```

### `ReactQuery.Provider.make()`

The React Context Provider responsible to hold all the react-query context

Definition:

```rescript
  module Provider = {
    let make: (
      ~client: queryClientValue,
      ~contextSharing: bool,
      ~children: React.element
    ) => React.element
  }
```

Usage:

```rescript
  <ReactQuery.Provider client={client}>children</ReactQuery.Provider>
```
