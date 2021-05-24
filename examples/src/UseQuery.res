module Promise = Js.Promise

type todo = {
  completed: bool,
  id: int,
  title: string,
  userId: int,
}

module Decode = {
  open Json.Decode
  let todo = json => {
    completed: field("completed", bool, json),
    id: field("id", int, json),
    title: field("title", string, json),
    userId: field("userId", int, json),
  }
}

let fetchTodo = id =>
  j`https://jsonplaceholder.typicode.com/todos/$id`
  ->Fetch.fetch
  ->Promise.then_(Fetch.Response.json, _)
  ->Promise.then_(value => Promise.resolve(Decode.todo(value)), _)

@react.component
let make = () => {
  let result = ReactQuery.useQuery(
    ReactQuery.queryOptions(
      ~queryKey="/todo-1",
      ~queryFn=_ => fetchTodo(1),
      ~retry=false->#bool->ReactQuery.retry,
      ~refetchIntervalInBackground=false,
      (),
    ),
  )

  switch result {
  | {data: Some(todo)} => <div> {todo.title->React.string} </div>
  | _ => React.null
  }
}
