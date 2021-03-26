import React from "react"
import * as ReactDOM from "react-dom"
import { use as useCountdown } from "./use-countdown/src/UseCountdown.js"
import "./use-countdown/src/UseCountdown.js"
import "./use-previous/src/UsePrevious.js"

console.log("anything?")

const App = () => {
  let count = useCountdown(10, () => console.log("ended"))
  return <div className="App">
    <header className="App-header">
      <p>
        Page has been open for <code>{count.time}</code> seconds.
        </p>
    </header>
  </div>
}

ReactDOM.render(<App />, document.getElementById("root"))