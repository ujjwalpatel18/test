<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            max-width: 400px;
            margin: auto;
            margin-top: 50px;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <h2 class="text-center">Login Form</h2>
        <form id="loginForm">
            <div class="form-group">
                <label for="email">Email Id *</label>
                <input type="email" class="form-control" id="email" placeholder="Your Email id.." required>
                <div id="emailError" class="error"></div>
            </div>
            <div class="form-group">
                <label for="password">Password *</label>
                <input type="password" class="form-control" id="password" placeholder="Your password.." required>
                <div id="passwordError" class="error"></div>
            </div>
            <div class="form-group">
                <label for="userType">User Type *</label>
                <select class="form-control" id="userType" required>
                    <option value="">Select User Type</option>
                    <option value="admin">Admin</option>
                    <option value="staff">Staff</option>
                    <option value="customer">Customer</option>
                </select>
                <div id="userTypeError" class="error"></div>
            </div>
            <button type="submit" class="btn btn-success btn-block">Login</button>
            <div id="loginError" class="error"></div>
        </form>
        <p class="text-center"><a href="#" id="forgotPasswordLink">Forgot Password?</a></p>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#loginForm').on('submit', function (e) {
                e.preventDefault();
                validateForm();
            });

            function validateForm() {
                let email = $('#email').val();
                let password = $('#password').val();
                let userType = $('#userType').val();

                let isValid = true;
                $('#emailError').text('');
                $('#passwordError').text('');
                $('#userTypeError').text('');
                $('#loginError').text('');

                // Email validation
                let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                if (!emailPattern.test(email)) {
                    $('#emailError').text('Invalid email format.');
                    isValid = false;
                }

                // Password validation
                let passwordPattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                if (!passwordPattern.test(password)) {
                    $('#passwordError').text('Password must be 6-16 characters long, include numbers and special characters.');
                    isValid = false;
                }

                // User type validation
                if (userType === '') {
                    $('#userTypeError').text('Please select a user type.');
                    isValid = false;
                }

                if (isValid) {
                    checkCredentials(email, password, userType);
                }
            }

            function checkCredentials(email, password, userType) {
                // Simulating a database check
                let userDB = {
                    'admin@gmail.com': {password: 'Admin@123', userType: 'admin'},
                    'staff@gmail.com': {password: 'Staff@123', userType: 'staff'},
                    'customer@gmail.com': {password: 'Customer@123', userType: 'customer'}
                };

                if (userDB[email] && userDB[email].password === password && userDB[email].userType === userType) {
                    alert('Login successful');
                } else {
                    $('#loginError').text('Invalid credentials, please try again!');
                }
            }

            $('#forgotPasswordLink').on('click', function () {
                let email = prompt('Please enter your email to reset password:');
                if (email) {
                    // Simulate sending a password reset email
                    alert('Password reset link has been sent to ' + email);
                }
            });
        });
    </script>
</body>
</html>
