import React, { Component } from 'react';
import { BrowserRouter, Route } from 'react-router-dom'
import Users from './Users';

class App extends Component {

  render() {
    return (
      <section className="section">
        <BrowserRouter>
          <Route path="/users/:userId/users" component={Users} />
        </BrowserRouter>
      </section>
    );
  }
}

export default App;
