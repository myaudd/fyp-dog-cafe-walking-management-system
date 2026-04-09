import { useState } from "react";
import { supabase } from "./supabaseClient";
import "./login.css";

const Login = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleSubmit = async () => {
    setError("");

    if (!username || !password) {
      setError("All fields are required.");
      return;
    }

    try {
      const { data, error } = await supabase
        .from("customer")
        .select("*")
        .eq("customername", username)
        .single();
  
      if (error || !data) {
        setError("User not found.");
        return;
      }
  
      if (data.customerpassword !== password) {
        setError("Incorrect password.");
        return;
      }

    alert("Log in successful!");
  } catch (err) {
    setError("Something went wrong.");
  }
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