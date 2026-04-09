import "./register.css";

const Register = () => {
  return (
    <div className="register-container">
      <h1>Register</h1>
      
      <div className="form-group">
        <label>Username</label>
        <input type="text" placeholder="Enter username" />

        <label>Email</label>
        <input type="email" id="email" name="email" placeholder="Enter email" />

        <label>Password</label>
        <input type="password" placeholder="Enter password" />
      </div>

      <button className="register-button">Create an account</button>
    </div>
  );
  };
  
  export default Register;