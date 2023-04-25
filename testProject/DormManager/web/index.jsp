<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <link rel="stylesheet"
              href="templateLogin/fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templateLogin/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
            body {
                background-image: url(img/background.jpg);
            }
        </style>
    </head>
    <body>

        <div>
            <div class="sign-in" style="">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure>
                                <img src="templateLogin/images/signin-image.jpg"
                                     alt="sign in image" />
                            </figure>
                            <a href="register.jsp" class="signup-image-link">Create an account</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Login</h2>
                            <form action="login" method="post" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="form2Example1"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                        type="email" name="email" id="form2Example1" placeholder="Email address" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="form2Example2"><i class="zmdi zmdi-lock"></i></label> <input
                                        type="password" name="password" id="form2Example2"
                                        placeholder="Password" class="form-control"/>
                                </div>
                                <div style="color: red;">${error }</div>
                                <div class="form-group form-button">
                                                        <button type="submit" class="btn btn-primary btn-block mb-4"><span class="p2">Sign in</span></button>

                                </div>
                                <div class="form-group form-button">
                                    <input type="checkbox" id="remember" name="remember" value="true">
                                    <label for="remember">Remember Password</label><br>
                                </div>

                            </form>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <li><a href="#"><i
                                                class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                    <li><a href="#"><i
                                                class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                    <li><a href="#"><i
                                                class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>