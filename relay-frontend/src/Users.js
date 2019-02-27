import React, { Component } from 'react';
import axios from 'axios';
import Can from './Can';
import { getUsers, getUser } from './utils/user';

class Users extends Component {
  state = {
    users: [],
    error: null,
    isLoading: true,
    loggedUser: {}
  }

  componentDidMount() {
    const { match: { params } } = this.props
    axios.all([
      getUsers(`${params.userId}`),
      getUser(`${params.userId}`)
    ])
      .then(axios.spread(
        (users, loggedUser) => {
          this.setState({
            users: users.data,
            loggedUser: loggedUser.data,
            isLoading: false
          })
        }
      ))
      .catch(error => this.setState({
        error,
        isLoading: false
      }))
  }

  render() {
    const { users, error, isLoading, loggedUser } = this.state;
    if (error) {
        return <p>{error.message}</p>
    }

    if (isLoading) {
        return <p>Loading...</p>
    }
    return (
      <section className="section">
        <section className="hero is-primary">
          <div className="hero-body">
            <div className="container">
              <h1 className="title">
                Users
              </h1>
            </div>
          </div>
        </section>
        <section className="section">
          <div className="container">
            {users.map((user) => {
              return (
                <div className="box" key={user.id}>
                  <h2>Name: {user.name}</h2>
                  <p>Role: {user.role}</p>
                  {
                    loggedUser.role === 'admin' ?
                    <a className="button is-danger">Delete</a>
                    : null
                  }
                </div>
              )
            })}
          </div>
        </section>
      </section>
    );
  }
}

export default Users;
