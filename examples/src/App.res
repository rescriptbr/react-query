module Promise = Js.Promise

@decco
type todo = {title: string}

module TodoQuery = ReactQuery.Query.Make({
  type queryKey = string
  type data = todo
  type error = string
  type decodeError = Decco.decodeError
  let decoder = todo_decode
})

let fetchTodo = _ =>
  Fetch.fetch("https://jsonplaceholder.typicode.com/todos/1") |> Promise.then_(Fetch.Response.json)

@react.component
let make = () => {
  let (result, _) = TodoQuery.useQuery(~queryKey="/todos/1", ~queryFn=fetchTodo, ())

  <div>
    {switch result {
    | Error(_) => <div> {React.string("Loading...")} </div>
    | _ => <div> {React.string("Whatever....")} </div>
    }}
  </div>
}
