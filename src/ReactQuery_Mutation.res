type mutationContext

type mutationStatus = [#loading | #success | #error]

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

@module("@tanstack/react-query")
external useMutation: mutationOptions<
  'mutationVariables,
  'mutationData,
  'mutationError,
  'unknown,
> => mutationResult<'mutationVariables, 'mutationData, 'mutationError, 'unknown> = "useMutation"
