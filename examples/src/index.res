let client = ReactQuery.Provider.createClient()

let _ = switch ReactDOM.querySelector("#root") {
| None => ()
| Some(element) =>
  ReactDOM.render(<ReactQuery.Provider client> <App /> </ReactQuery.Provider>, element)
}
