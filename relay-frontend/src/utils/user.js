import axios from 'axios';

export function getUsers(id) {
    return axios.get(`http://localhost:3001/api/v1/users/${id}/users.json`)
        .then(response => response);
}

export function getUser(id) {
    return axios.get(`http://localhost:3001/api/v1/users/${id}.json`)
        .then(response => response);
}