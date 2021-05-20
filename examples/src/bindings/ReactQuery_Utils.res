module Query = ReactQuery_Query
external unwrap: 'a => 'b = "%identity"

let retry: Query.retryParam<'queryError> => Query.retryValue<'queryError> = value =>
  switch value {
  | #bool(value) => unwrap(value)
  | #number(value) => unwrap(value)
  | #fn(value) => unwrap(value)
  }

let retryDelay: Query.retryDelayParam<'queryError> => Query.retryDelayValue<'queryError> = value =>
  switch value {
  | #number(value) => unwrap(value)
  | #fn(value) => unwrap(value)
  }

let time: Query.time => Query.timeValue = value =>
  switch value {
  | #number(value) => unwrap(value)
  | #infinity => unwrap(infinity)
  }

let refetchInterval = value =>
  switch value {
  | #bool(value) => unwrap(value)
  | #number(value) => unwrap(value)
  }

let boolOrAlways = value =>
  switch value {
  | #bool(value) => unwrap(value)
  | #always => unwrap(#always)
  }

let notifyOnChangeProps = value =>
  switch value {
  | #array(value) => unwrap(value)
  | #tracked => unwrap(#tracked)
  }

let refetchOnMount = boolOrAlways
let refetchOnWindowFocus = boolOrAlways
let refetchOnReconnect = boolOrAlways
