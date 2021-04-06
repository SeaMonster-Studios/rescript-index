import "./index.css"
import React from "react"
import * as ReactDOM from "react-dom"

window.location = "http://localhost:5000"

const App = () => {
  return <p>
    This is not the page you're looking for. Make sure that you're running both snowpack (which shows this root) as well as cosmos which both proxies this root and provides the URL you should be viewing. If you ran the `yarn docs` script and landed here, try <a href="http://localhost:5000">http://localhost:5000</a> instead.
      </p>
}

ReactDOM.render(<App />, document.getElementById("root"))