<html>
    <head>
        <title>signup</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel = "stylesheet" href = "css\signin.css"/>
        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
        <script type="text/javascript">
            function Validate() {
                var password = document.getElementById("txtPassword").value;
                var confirmPassword = document.getElementById("txtConfirmPassword").value;
                if (password != confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body style="background-image: url('images_1/3.jpg');">
        <form action="addRecord" onsubmit="return Validate()">
            <div >
                <h1 style="font-family:Carta Magna Line;"> &nbsp The Times-Journal<h1>
                        <ul class="p2">
                            <li class="p3"><a href="About_us.html">About Us</a></li>
                            <li class="p3"><a href="signup.jsp">Sign Up</a></li>
                            <li class="p3" ><a href="login.jsp">Login</a></li>
                            <li class="p3"><a href="index.html">Home</a></li>
                        </ul>
                        </div>
                        <br/>
                        <br/>
                        <fieldset>
                                <center>
                                    <div class="container">
                                        <table style="width:35%;height:45%;">
                                            <tr>
                                                <th>First Name</th>
                                                <th><input type = "text" name ="nds.first_name" placeholder="First Name"></th>
                                            </tr>
                                            <tr>
                                                <th>Last Name</th>
                                                <th><input type = "text" name ="nds.last_name" placeholder="Last Name"></th>
                                            </tr>
                                            <tr>
                                                <th>Email-id</th>
                                                <th><input type = "email" name ="nds.email" placeholder="Email-id"></th>
                                            </tr>
                                            <tr>
                                                <th>Mobile Number</th>
                                                <th><input type = "number" name ="nds.phone_number" placeholder="Mobile Number"></th>
                                            </tr>
                                            <tr>
                                                <th>Username</th>
                                                <th><input type = "text" name ="nds.username" placeholder="Username"></th>
                                            </tr>
                                            <tr>
                                                <th>Password</th>
                                                <th><input type = "password" name ="nds.password" placeholder="Password" id="txtPassword"></th>
                                            </tr>
                                            <tr>
                                                <th>Confirm Password</th>
                                                <th><input type = "password" name ="c_password" placeholder="Confirm Password" id="txtConfirmPassword"></th>
                                            </tr>
                                            <tr>
                                                <th>Gender</th>
                                                <th><input type = "radio" name ="nds.gender" value = "Male">Male
                                                    <input type = "radio" name ="nds.gender" value = "Female">Female
                                                    <input type = "radio" name ="nds.gender" value = "Other">Other</th>
                                            </tr>
                                            <tr>
                                                <th>Age</th>
                                                <th><input type="text" name="nds.age" placeholder="Age"></th>
                                            </tr>
                                            <tr>
                                                <th>Category</th>                                    <th><input type = "radio" name ="nds.category" value = "Vendor">Vendor
                                                    <input type = "radio" name ="nds.category" value = "Customer">Customer
                                            </tr>

                                        </table>
                                        <table>
                                            <tr>
                                                <th><button type="submit" class="registerbtn">Sign Up</button></th>
                                                <th><button type="reset" class="registerbtn">Reset</button></th>
                                            </tr>
                                        </table>
                                    </div>
                                </center>
                        </fieldset>
                        <footer >
                            <ul type =none>
                                <li class="line"><a href="index.html">Home</a></li>
                                <li class="line"><a href="login.jsp">Login</a></li>
                                <li class="line"><a href="signup.jsp">Sign Up</a></li>
                                <li class="line"><a href="About_us.html">About Us</a></li>

                            </ul>
                            <p style = "color:white;text-align: right">Copyright &copy 2020, All Rights Reserved by Nishachars</p>
                        </footer>
                        </form>
                        </body>
                        </html>