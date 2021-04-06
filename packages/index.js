import "./index.css"
import React from "react"
import * as ReactDOM from "react-dom"

const App = () => {
  return <p>
    This is not the page you're looking for. Make sure that you're running both snowpack (which shows this root) as well as cosmos which both proxies this root and provides the URL you should be viewing.
      </p>
}

ReactDOM.render(<App />, document.getElementById("root"))