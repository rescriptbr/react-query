type query
type queryFunctionContext
type timeValue
type boolOrAlwaysValue
type refetchIntervalValue
type notifyOnChangePropsValue
type retryValue<'queryError>
type retryDelayValue<'queryError>
type queryDataKeyOrFilterValue<'queryKey>

type retryParam<'error> = [#bool(bool) | #number(int) | #fn((int, 'error) => bool)]
type retryDelayParam<'error> = [#number(int) | #fn((int, 'error) => int)]
type time = [#number(int) | #infinity]
type refetchInterval = [#bool(bool) | #number(int)]
type boolOrAlways = [#bool(bool) | #always]
type notifyOnChangeProps = [#array(array<string>) | #tracked]
type infiniteData<'queryData, 'params> = {
  pages: array<'queryData>,
  pageParams: array<'params>,
}
type queryStatus = [#loading | #success | #idle | #error | #initialData]

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
