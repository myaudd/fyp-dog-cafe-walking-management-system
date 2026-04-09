import "./Login.css";

const Login = () => {
  return (
    <div className="login-container">
      <h2>Login</h2>
      
      <div className="form-group">
        <label>Username</label>
        <input type="text" placeholder="Enter username" />

        <label>Password</label>
        <input type="password" placeholder="Enter password" />
      </div>

      <button className="login-button">Log In</button>
    </div>
  );
};

export default Login;