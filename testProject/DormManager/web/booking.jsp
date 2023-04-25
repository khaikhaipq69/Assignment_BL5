


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose Type</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="booking.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <div class="container">
            <h1 style="font-weight: bold; font-size: 96px; text-align: center">
                <span class="span1">Booki</span><span class="span2">ng Dorm</span><span class="span3">itory</span><span class="span1"> F</span><span class="span2">P</span><span class="span3">T</span>
            </h1><br><br>
            <div class="row">
                <div class="col-2" style="font-size: 25px; margin-left: 10%">
                    <b>Room Type:</b>
                </div>
                <div  class="col">
                    <form action="booking" method="post">
                        <select name="rtid" class="form-select form-select-lg mb-3" style="width: 800px" aria-label=".form-select-lg example">
                            <c:forEach var="r" items="${ls}">
                                <option value="${r.typeId}">${r.typeName } - ${r.bed} beds - ( <fmt:formatNumber type = "number" 
                                                                                                  maxFractionDigits = "3" value = "${r.price}" /> VND )</option>
                                </c:forEach>
                        </select>
                        <button class="btn-primary" type="submit"><b>Submit</b></button>
                    </form>
                </div>

            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
