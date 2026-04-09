import { useState } from "react";
import "./login.css";

const Login = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleSubmit = () => {
    setError("");

    if (!username || !password) {
      setError("All fields are required.");
      return;
    }

    alert("Log in successful!");
  };

  return (
    <div className="login-container">
      <h1>Login</h1>
      
      <div className="form-group">
        <label>Username</label>
        <input
          type="text"
          placeholder="Enter username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />

        <label>Password</label>
        <input
          type="password"
          placeholder="Enter password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
      </div>

      {error && <p className="error-text">{error}</p>}

      <button className="login-button" onClick={handleSubmit}>
        Log in
      </button>
    </div>
  );
};

export default Login;