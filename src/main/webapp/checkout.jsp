<%-- 
    Document   : checkout
    Created on : Jan 13, 2022, 4:42:09 PM
    Author     : The Bigger
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Đặt hàng thành công</title>
        <jsp:include page="link.jsp" />  

    <body>
        <!-- Header -->

        <div class="page-left-sidebar">
             <jsp:include page="header.jsp" />
        </div>
        <div class="page-right-content">
            <div class="container">
                <div class="complete-page text-center">
                    <h2 class="status"><span class="ion-checkmark-circled fa-4 icon-check"></span>Đặt hàng <span>thành công </span></h2>
                    <h2> Kiểm tra đơn hàng của bạn trong email</h2>
                    <a class="status" href="index.jsp">Tiếp tục mua hàng</a>
                </div>
                <?php include('footer.php') ?>
            </div>
        </div>

    </body>

</html>
