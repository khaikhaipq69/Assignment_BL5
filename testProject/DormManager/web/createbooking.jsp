
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Booking</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="createbooking.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <div class="container">
            <h2 style="font-weight: bold; font-size: 45px">
                <span class="span1">Booki</span><span class="span2">ng Dorm</span><span class="span3">itory</span>
            </h2>
            <div class="row">
                <div class="col-8">
                    <p>Your Account Balance (Tổng tiền có trong tài khoản FAP): <span style="color: #124DA3; font-weight: bold; font-size: 20px"><fmt:formatNumber type = "number" 
                                      maxFractionDigits = "3" value = "${acc.balance}" /></span> <span style="color:#124DA3; font-weight: bold; font-size: 20px">₫</span>
                    </p>
                    <p>Minimum Balance required in VND (Số tiền tối thiểu cần có trong tài khoản để đặt phòng): <span style="color: red; font-weight: bold; font-size: 20px"><fmt:formatNumber type = "number" 
                                      maxFractionDigits = "3" value = "${r.price}" /></span> <span style="color: red; font-weight: bold; font-size: 20px">₫</span>
                    </p>
                    <p>Your Balance after booking (Số tiền còn lại sau khi book phòng): <span style="color: #124DA3; font-weight: bold; font-size: 20px"><fmt:formatNumber type = "number" 
                                      maxFractionDigits = "3" value = "${acc.balance-r.price}" /></span> <span style="color: #124DA3; font-weight: bold; font-size: 20px">₫</span>
                    </p>
                    <p>Số slot còn lại: <span id="total" style="font-size: 20px; font-weight: bold; color: #124DA3">${lsRoom.size()}</span>
                    </p>
                    <form id="form" action="createbooking" method="post"> 
                        <div class="row">
                            <div class="col-2">
                                <b>Roll number: </b>
                            </div>
                            <div  class="col">
                                <b>${acc.rollNumber}</b>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <b>Room Type: </b>
                            </div>
                            <div  class="col">
                                <b>${r.typeName } - ${r.bed} beds - ( <fmt:formatNumber type = "number" 
                                                                                     maxFractionDigits = "3" value = "${r.price}" />₫</b> )
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <b>Dom: </b>
                            </div>
                            <div  class="col">
                                <select onchange="handleSelect()" id="domId"  class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                    <c:if test="${lsDom.size()>0}">
                                        <c:forEach var="d" items="${lsDom}" >
                                            <option value="${d.domId}" >${d.domName}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <b>Floor: </b>
                            </div>
                            <div  class="col">
                                <select onchange="handleSelect()" id="floor" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                    <c:forEach var="i" begin="1" end="5">
                                        <option value="${i}" >${i}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <b>Room: </b>
                            </div>
                            <div  class="col">
                                <select  id="room" name="rid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                    <c:forEach var="r" items="${lsRoom}" >
                                        <option value="${r.roomId}" >${r.roomName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <b>Semester: </b>
                            </div>
                            <div  class="col">
                                <select name="tid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                    <c:forEach var="t" items="${lsTerm}">
                                        <option value="${t.termId}" >${t.termName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <button onclick="handleSubmit()" class="btn btn-primary" ><b>Submit</b></button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            const balance = '${acc.balance}';
            const price = '${r.price}';
           
            const handleSelect = async function () {
                const domId = document.getElementById("domId").value;
                const floor = document.getElementById("floor").value;
                const res = await fetch('room?did=' + domId + '&fid=' + floor).then(res => res.json());
                document.getElementById("total").innerHTML = res.length;
                document.getElementById("room").innerHTML = res.map(r => "<option value=" + r.roomId + ">" + r.roomName + "</option>");
            };
            const handleSubmit = () => {
                event.preventDefault();
                const form = document.getElementById("form");

                if ((+balance)<(+price)) {
                    alert("your balance is not enough to make a transaction! ");
                    return;
                }
                if (confirm("Do you want to book this room in next term?")) {
                    form.submit();
                }
            };
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
