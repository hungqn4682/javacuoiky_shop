
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí bán hàng</title>
        <jsp:include page="link.jsp" />  
    </head>
    <body>
        <jsp:include page="Searchbox.jsp" />
        <div class="page-left-sidebar">
            <jsp:include page="header.jsp" />
        </div>
        <div class="page-right-content">
            <jsp:include page="Slide.jsp" />
            <div class="product-content">
                <div class="product-collection">
                    <div class="pattern"></div>                    
                </div>
               
                <jsp:include page="Product.jsp" />
            </div>
        </div>
    </body>
</html>
