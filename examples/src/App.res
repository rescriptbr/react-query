module Fetch = {
  type response

  @send external json: response => Js.Promise.t<'a> = "json"
  @val external fetch: string => Js.Promise.t<response> = "fetch"
}

type todo = {id: string, title: string}

let apiUrl = "https://jsonplaceholder.typicode.com/todos/1"

let fetchTodos = (_): Js.Promise.t<todo> => {
  Fetch.fetch(apiUrl)->Promise.then(Fetch.json)
}

module TodoItem = {
  @react.component
  let make = () => {
    let queryResult = ReactQuery.useQuery(
      ReactQuery.queryOptions(
        ~queryFn=fetchTodos,
        ~queryKey="todos",
        /*
         * Helper functions to convert unsupported TypeScript types in ReScript
         * Check out the module ReactQuery_Utils.res
         */
        ~refetchOnWindowFocus=ReactQuery.refetchOnWindowFocus(#bool(false)),
        (),
      ),
    )

    <div>
      {switch queryResult {
      | {isLoading: true} => "Loading..."->React.string
      | {data: Some(todo), isLoading: false, isError: false} =>
        `Todo Title ${todo.title}`->React.string
      | _ => `Unexpected error...`->React.string
      }}
    </div>
  }
}

/*
 * Create a new client
 */
let client = ReactQuery.Provider.createClient()

@react.component
let make = () => {
  <ReactQuery.Provider client>
    <div> <h1> {React.string("ReScript + React Query")} </h1> <TodoItem /> </div>
  </ReactQuery.Provider>
}
