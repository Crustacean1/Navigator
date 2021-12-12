import React, { useState } from "react";
import PropTypes from 'prop-types';
import { loginUser } from "../authService";
import "./login.css";

export function Login({ setToken, getToken }) {
    const [username, setUserName] = useState();
    const [password, setPassword] = useState();

    const handleSubmit = async e => {
        const mockData = "48AD0463531B021BB64F932D97287574";
        setToken(mockData);
        if (getToken() != null) {
            window.location.href = "/";
        }
        e.preventDefault();
        await loginUser({
            username,
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
            <div class="logo"></div>
            <div class="login-block">
                <h1>Login</h1>
                <input onChange={e => setUserName(e.target.value)} type="text" value="" placeholder="Username" id="username" />
                <input onChange={e => setPassword(e.target.value)} type="password" value="" placeholder="Password" id="password" />
                <button className="link" type="submit" >Submit</button>
            </div>
        </form>
    );
}

Login.propTypes = {
    setToken: PropTypes.func.isRequired,
    getToken: PropTypes.func.isRequired
}