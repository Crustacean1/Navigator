import React, { useState } from 'react';
import './App.css';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import { Menu } from './nav/Menu';
import { Home } from './ui/home/Home';
import { Login } from './auth/login/Login'
import { Reports } from './ui/reports/reports';
import { MyPage } from './ui/myPage/myPage';

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


  if (!token) {
    return <Login setToken={setToken} getToken={getToken} />
  }
  else {
    return (
      <Router>
        <Menu />
        <Switch>
          <Route path='/' exact component={Home} />
          <Route path='/mypage' component={() => <MyPage token={token} />} />
          <Route path='/reports' component={() => <Reports token={token} />} />
        </Switch>
      </Router>
    );
  }
}