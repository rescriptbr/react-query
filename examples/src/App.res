module Fetch = {
  type response

  @send external json: response => Js.Promise.t<'a> = "json"
  @val external fetch: (string, {..}) => Js.Promise.t<response> = "fetch"
}

type todo = {id: string, title: string}

let apiUrl = "https://jsonplaceholder.typicode.com/todos/1"
let client = ReactQuery.Provider.createClient()

let fetchTodos = (_): Js.Promise.t<todo> => {
  let {then} = module(Promise)

  Fetch.fetch(
    apiUrl,
    {
      "method": "GET",
    },
  )->then(Fetch.json)
}

module TodoItem = {
  let {useQuery, queryOptions} = module(ReactQuery)

  @react.component
  let make = () => {
    let queryResult = useQuery(
      queryOptions(
        ~queryFn=fetchTodos,
        ~queryKey="todos",
        ~refetchOnWindowFocus=ReactQuery.refetchOnWindowFocus(#bool(false)),
        (),
      ),
    )

    <div>
      {switch queryResult {
      | {isLoading: true} => "Loading..."->React.string
      | {data: Some(todo)} => `Todo Title ${todo.title}`->React.string
      | _ => `Unexpected error...`->React.string
      }}
    </div>
  }
}

@react.component
let make = () => {
  <ReactQuery.Provider client>
    <div> <h1> {React.string("ReScript + React Query")} </h1> <TodoItem /> </div>
  </ReactQuery.Provider>
}
