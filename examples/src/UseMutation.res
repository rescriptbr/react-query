module Promise = Js.Promise

type post = {
  title: string,
  body: string,
  userId: int,
}

type response = {id: int}

type todo = {titles: string}

module Decode = {
  open Json.Decode
  let response = json => {
    id: field("id", int, json),
  }
}

module Encode = {
  open Json.Encode
  let post = value =>
    object_(list{
      ("title", string(value.title)),
      ("body", string(value.body)),
      ("userId", int(value.userId)),
    })
    ->Js.Json.stringify
    ->Fetch.BodyInit.make
}

let createTodo = post =>
  Fetch.fetchWithInit(
    "https://jsonplaceholder.typicode.com/posts",
    Fetch.RequestInit.make(~method_=Post, ~body=post->Encode.post, ()),
  )
  ->Promise.then_(Fetch.Response.json, _)
  ->Promise.then_(value => value->Decode.response->Promise.resolve, _)

@react.component
let make = () => {
  let {mutate, isLoading, isSuccess, data, _} = ReactQuery.useMutation(
    ReactQuery.mutationOptions(
      ~mutationKey="create-post",
      ~mutationFn=createTodo,
      ~retry=false->#bool->ReactQuery.retry,
      (),
    ),
  )

  let handleCreation = React.useCallback1(_ => {
    let post = {
      title: "Test",
      body: "My test",
      userId: 1,
    }
    mutate(. post, None)
  }, [mutate])

  <div>
    {isLoading ? <p> {`Loading...`->React.string} </p> : React.null}
    {switch (isSuccess, data) {
    | (true, Some({id})) => <p> {j`Post created: $id`->React.string} </p>
    | _ => React.null
    }}
    <button onClick={handleCreation}> {`Click here`->React.string} </button>
  </div>
}
