let retry: ReactQuery_Types.retryParam<'error> => ReactQuery_Types.retryValue<'error> = value =>
  switch value {
  | #bool(value) => Obj.magic(value)
  | #number(value) => Obj.magic(value)
  | #fn(value) => Obj.magic(value)
  }

let retryDelay: ReactQuery_Types.retryDelayParam<'error> => ReactQuery_Types.retryDelayValue<
  'error,
> = value =>
  switch value {
  | #number(value) => Obj.magic(value)
  | #fn(value) => Obj.magic(value)
  }

let time: ReactQuery_Types.time => ReactQuery_Types.timeValue = value =>
  switch value {
  | #number(value) => Obj.magic(value)
  | #infinity => Obj.magic(infinity)
  }

let refetchInterval = value =>
  switch value {
  | #bool(value) => Obj.magic(value)
  | #number(value) => Obj.magic(value)
  }

let boolOrAlways = value =>
  switch value {
  | #bool(value) => Obj.magic(value)
  | #always => Obj.magic(#always)
  }

let notifyOnChangeProps = value =>
  switch value {
  | #array(value) => Obj.magic(value)
  | #tracked => Obj.magic(#tracked)
  }

let setQueryData: ReactQuery_Types.queryDataKeyOrFilter<
  'queryKey,
> => ReactQuery_Types.queryDataKeyOrFilter<'queryKey> = value =>
  switch value {
  | #keys(value) => Obj.magic(value)
  | #filters(value) => Obj.magic(value)
  }

let placeholderData: ReactQuery_Types.placeholderData<
  'queryData,
  'queryResult,
> => ReactQuery_Types.placeholderDataValue = value =>
  switch value {
  | #data(data) => Obj.magic(data)
  | #function(value) => Obj.magic(value)
  }

let refetchOnMount = boolOrAlways
let refetchOnWindowFocus = boolOrAlways
let refetchOnReconnect = boolOrAlways
