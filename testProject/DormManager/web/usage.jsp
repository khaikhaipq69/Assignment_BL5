<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electric Water Usage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <%@include file="nav.jsp"%>
        <div class="container">
            <h3 style="text-align: center; font-size: 40px; font-weight: bold; padding-top: 50px; color: #124DA3">View monthly Electric / Water ( Xem mức sử dụng Điện / Nước )</h3>
            <div class="row" style="margin-left: 15%; padding-top: 50px">
                <div class="col-2">
                    <b style="font-size: 30px; color: #124DA3">Semester:</b>
                </div>
                <div  class="col-6">
                    <form action="viewinfo" method="post">
                        <select name="tid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                            <c:forEach var="t" items="${lsTerm}">
                                <option <c:if test="${selectedid==t.termId}">selected</c:if> value="${t.termId}" >${t.termName}</option>
                            </c:forEach>
                        </select>
                </div>
                <div class="col-2"><button class="btn btn-primary"><b>Search</b></button></div>
                </form>
            </div>
            <c:if test="${info!=null}">
                <div class="row" style="text-align: center">
                    <b style="color: #4EB748"> Room No: ${info.roomName}</b>
                    <b style="color: #F37022"> Electric usage: ${info.electric} (kw/h)</b>
                    <b style="color: #124DA3"> Water usage: ${info.water} (m3)</b>
                </div>
            </c:if>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
