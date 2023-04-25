
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
            .a{
                font-size: 20px;
                font-weight: bold;
                color:  black;
            }
            .b{
                font-size: 20px;
                font-weight: bold;
                color: red;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="https://th.bing.com/th/id/R.a8822ae62feb5a9fa07b75ed12dfc0bd?rik=cfVLbphRgMqkrA&pid=ImgRaw&r=0" alt="" width="100px" class="d-inline-block align-text-top">
                </a>
                <c:if test="${acc!=null}">
                    <span class="a">Wellcome ${acc.fullname} to Dormitory !</span>
                    <a class="b" href="login"><b>Log out</b></a>
                </c:if>
                <c:if test="${acc==null}">
                    <a href="login"><b>Log in</b></a>
                </c:if>
            </div>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
