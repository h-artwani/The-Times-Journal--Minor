<!DOCTYPE html>
<html>
    <head>
        <title>Log in</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel = "stylesheet" href = "css\login.css"/>
        <link rel = "stylesheet" href = "css\mark1.css"/>
        <link rel = "stylesheet" href = "css\mark2.css"/>
    </head>
    <body style="background-image: url('images_1/4.jpg');height:100%;background-size: cover;">
        <form action="welcome" method="get">
            <div>
                <h1 style="font-family:Carta Magna Line"> &nbsp The Times-Journal<h1>
                        <ul class="p2">
                            <li class="p3"><a href="About_us.html">About Us</a></li>
                            <li class="p3"><a href="signup.jsp">Sign Up</a></li>
                            <li class="p3" ><a href="login.jsp">Login</a></li>
                            <li class="p3"><a href="index.html">Home</a></li>
                        </ul>
                        </div>

                        <fieldset>
                            <form action="welcome">
                                <div class="imgcontainer">
                                    <img src="images\11.png" alt="Avatar" class="avatar">
                                </div>
                                <br/>
                                <div class="container">
                                    <label for="uname"><b>Username</b></label>
                                    <input type="text" placeholder="Enter Username" name="nds.username" required>
                                    <br/>
                                    <br/>
                                    <br/>
                                    <label for="psw"><b>Password</b></label>
                                    <input type="password" placeholder="Enter Password" name="nds.password" required>
                                    <br/>
                                    <br/> 
                                    <table>
                                        <tr>
                                            <th>Category</th>
                                            <th><input type = "radio" name ="nds.category" value = "Admin">Admin
                                            <th><input type = "radio" name ="nds.category" value = "Vendor">Vendor
                                                <input type = "radio" name ="nds.category" value = "Customer">Customer
                                        </tr>
                                    </table>	
                                    <br/>
                                    <br/>							
                                    <button type="submit">Login</button>
                                </div>

                                <div class="container" style="background-color:#f1f1f1">
                                    <span class="psw"> <a href="forgot_password.jsp" style="text-decoration:none;color:black;">Forgot password?</a></span>
                                </div>
                            </form>
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