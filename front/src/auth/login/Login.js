import React, { useState } from "react";
import PropTypes from 'prop-types';
import { loginUser } from "../authService";
import "./login.css";

export function Login({ setToken, getToken }) {
    const [login, setLogin] = useState();
    const [password, setPassword] = useState();

    const handleSubmit = async e => {
        e.preventDefault();
        await loginUser({
            login,
            password
        }).then(response => response.json())
            .then(data => {
                setToken(data.token);
                if (getToken() != null) {
                    window.location.href = "/";
                }
            });

    }
    return (
        <form onSubmit={handleSubmit}>
            <div className="logo"></div>
            <div className="login-block">
                <h1>Login</h1>
                <input onChange={e => setLogin(e.target.value)} type="text" placeholder="Username" id="username" />
                <input onChange={e => setPassword(e.target.value)} type="password" placeholder="Password" id="password" />
                <button className="link" type="submit" >Submit</button>
            </div>
        </form>
    );
}

Login.propTypes = {
    setToken: PropTypes.func.isRequired,
    getToken: PropTypes.func.isRequired
}