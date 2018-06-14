import React, { Component } from 'react'
import './App.css'
import 'whatwg-fetch'

const fetchMessage =
  function(){
    fetch('/api/hello', {
     headers: {
       "Content-Type": "application/json"
     }
    }).then(response => {
      return response.json()
    }).then(json => {
      if (json.message === '' || json.message === 'undefined') {
       return { message: json.message }
      }
      else {
       return { message: 'moon' }
      }
    })
  }

class App extends Component {

  constructor(props){
    super(props)
    this.state = { message: 'moon' }
  }

  componentDidMount() {
    this.interval = setInterval(() => this.updateState(), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  updateState() {
    this.setState(fetchMessage());
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
