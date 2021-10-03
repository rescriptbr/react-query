type mutationContext

type mutationStatus = [#loading | #success | #idle | #error]

type mutateParams<'mutationVariables, 'mutationData, 'mutationError, 'unknown> = {
  onSuccess: option<
    ('mutationData, 'mutationVariables, Js.Nullable.t<mutationContext>) => Js.Promise.t<'unknown>,
  >,
  onError: option<
    ('mutationError, 'mutationVariables, Js.Nullable.t<mutationContext>) => Js.Promise.t<'unknown>,
  >,
  onSettled: option<
    (
      'mutationData,
      'mutationError,
      'mutationVariables,
      Js.Nullable.t<mutationContext>,
    ) => Js.Promise.t<'unknown>,
  >,
}

@deriving(abstract)
type mutationOptions<'mutationVariables, 'mutationData, 'mutationError, 'unknown> = {
  mutationKey: string,
  mutationFn: 'mutationVariables => Js.Promise.t<'mutationData>,
  @optional onMutate: 'mutationVariables => Js.Promise.t<mutationContext>,
  @optional
  onSuccess: (
    'mutationData,
    'mutationVariables,
    Js.Nullable.t<mutationContext>,
  ) => Js.Promise.t<'unknown>,
  @optional
  onError: (
    'mutationError,
    'mutationVariables,
    Js.Nullable.t<mutationContext>,
  ) => Js.Promise.t<'unknown>,
  @optional
  onSettled: (
    'mutationData,
    'mutationError,
    'mutationVariables,
    Js.Nullable.t<mutationContext>,
  ) => Js.Promise.t<'unknown>,
  @optional retry: ReactQuery_Types.retryValue<'mutationError>,
  @optional retryDelay: ReactQuery_Types.retryDelayValue<'mutationError>,
  @optional useErrorBoundary: bool,
}

type mutationResult<'mutationVariables, 'mutationData, 'mutationError, 'unknown> = {
  mutate: (
    . 'mutationVariables,
    option<mutateParams<'mutationVariables, 'mutationData, 'mutationError, 'unknown>>,
  ) => unit,
  mutateAsync: (
    'mutationVariables,
    mutateParams<'mutationVariables, 'mutationData, 'mutationError, 'unknown>,
  ) => Js.Promise.t<'mutationData>,
  status: mutationStatus,
  isIdle: bool,
  isError: bool,
  isLoading: bool,
  isSuccess: bool,
  data: option<'mutationData>,
  error: Js.Nullable.t<'mutationError>,
  reset: unit => unit,
}

@module("react-query")
external useMutation: mutationOptions<
  'mutationVariables,
  'mutationData,
  'mutationError,
  'unknown,
> => mutationResult<'mutationVariables, 'mutationData, 'mutationError, 'unknown> = "useMutation"
