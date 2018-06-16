import React, { Component } from 'react'
import './App.css'
import 'whatwg-fetch'

class App extends Component {

  constructor(props){
    super(props)
    this.state = { message: 'there' };
  }

  componentDidMount() {
    var self = this;

    self.interval = setInterval(() =>
      fetch('/api/hello', {
        headers: {"Content-Type": "application/json"}
      }).then(response => {
        return response.json()
      }).then(json => {
        return { message: json.message[0] || 'there' }
      }).then(newState => {
        self.setState(newState)
      })
    , 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    return <div className="App">
        <header className="App-header">
          <h1 className="App-title">ks3 app</h1>
        </header>
        <p className="App-intro">
          ks3 app here...
          hello {this.state.message}
        </p>
      </div>
  }
}

export default App
