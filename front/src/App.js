import React, { useState } from 'react';
import './App.css';
import { Login } from './auth/login/Login'
import { Report } from './ui/report/Report';

function setToken(userToken) {
  sessionStorage.setItem('token', JSON.stringify(userToken));
}

function getToken() {
  const tokenString = sessionStorage.getItem('token');
  const userToken = JSON.parse(tokenString);
  return userToken;
}

export function App() {
  const token = getToken();

  console.log(token);

  if (!token) {
    return <Login setToken={setToken} getToken={getToken} />
  }
  else {
    return <Report token={token} />
  }
}