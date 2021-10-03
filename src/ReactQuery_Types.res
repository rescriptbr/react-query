type query
type timeValue
type boolOrAlwaysValue
type refetchIntervalValue
type notifyOnChangePropsValue
type retryValue<'queryError>
type retryDelayValue<'queryError>
type queryDataKeyOrFilterValue<'queryKey>
type placeholderDataValue

type queryFunctionContext<'queryKey, 'pageParam> = {
  queryKey: 'queryKey,
  pageParam: 'pageParam,
}

type retryParam<'error> = [#bool(bool) | #number(int) | #fn((int, 'error) => bool)]
type retryDelayParam<'error> = [#number(int) | #fn((int, 'error) => int)]
type time = [#number(int) | #infinity]
type refetchInterval = [#bool(bool) | #number(int)]
type boolOrAlways = [#bool(bool) | #always]
type notifyOnChangeProps = [#array(array<string>) | #tracked]
type infiniteData<'queryData, 'pageParam> = {
  pages: array<'queryData>,
  pageParams: array<'pageParam>,
}
type queryStatus = [#loading | #success | #idle | #error | #initialData]

type placeholderData<'queryData, 'queryResult> = [
  | #data('queryData)
  | #function(unit => option<'queryResult>)
]

@deriving(abstract)
type queryFilter<'queryKey> = {
  @optional exact: bool,
  @optional active: bool,
  @optional inactive: bool,
  @optional stale: bool,
  @optional fetching: bool,
  @optional predicate: query => bool,
  @optional queryKey: 'queryKey,
}

type queryDataKeyOrFilter<'queryKey> = [#keys('queryKey) | #filters(queryFilter<'queryKey>)]

type refetchOptions = {
  throwOnError: bool,
  cancelRefetch: bool,
}
