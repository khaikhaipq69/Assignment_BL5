

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="dashboard.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>Student Board</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <div class="container">
            <h1 style="font-size: 50px; padding-top: 30px; text-align: center">
                <span class="span1">Stud</span><span class="span2">ent B</span><span class="span3">oard</span>
            </h1>
            <div class="mb-4">
                Mọi thắc mắc hoặc góp ý xin gửi về ktx@fpt.edu.vn (Please contact us at ktx@fpt.edu.vn if you have any question).
            </div>
            <div class="row">
                <div class="col" style="margin-left: 20%">
                    <div class="card" style="width: 18rem">
                        <div class="card-header">
                            <span class="p1">Actions (Hành động)</span>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><a class="text-decoration-none" href="booking"><span class="b1"><b>Book a bed (Đặt chỗ)</b></span></a></li>
                            <li class="list-group-item"><a class="text-decoration-none" href="viewinfo"><span class="v1"><b>View Monthly Electric / Water Usage (Xem mức sử dụng điện / nước)</b></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <div class="card-header">
                            <span class="p1">Useful information (Thông tin hữu ích)</span>
                        </div>
                        <div class="m-2">
                            <h7 class="card-title"><span class="card-title1">Your FAP Balance (Tổng số tiền trong tài khoản: </span><span style="color: #124DA3"><b style="font-size: 20px"><fmt:formatNumber type = "number" 
                                              maxFractionDigits = "3" value = "${acc.balance}" /></b></span><span style="color: #124DA3"><b> ₫</b></span></h7>
                        </div>
                        <div class="m-2">
                            <h7 class="card-title"><span class="card-title2">Your gender information at FAP system: </span>${acc.gender}, if this information is not correct, please contact Academic staff.( Thông tin giới tính của bạn ghi nhận tại FAP:  ${acc.gender}. Nếu thông tin không chính xác bạn hãy yêu cầu sửa lại tại phòng Dịch Vụ Sinh Viên)</h7>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
