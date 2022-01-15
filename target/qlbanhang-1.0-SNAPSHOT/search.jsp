<%-- 
    Document   : search
    Created on : Jan 5, 2022, 10:46:49 AM
    Author     : The Bigger
--%>

<%@page import="com.mycompany.qlbanhang.Model.sanpham"%>
<%@page import="com.mycompany.qlbanhang.DAO.sanphamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm kiếm sản phẩm</title>
        <jsp:include page="link.jsp" />  
    </head>

    <% sanphamDAO spDAO = new sanphamDAO();
        String tensp = request.getParameter("tensp");
    %>
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
                <div class="product-bestselling text-center">
                    <div class="product-header">
                        <h2>Danh mục</h2>
                    </div>
                    <div class="row">
                        <%    for (sanpham sp : spDAO.getSpbySearch(tensp)) {%>
                        <div class="col-md-15 col-sm-4 col-xs-6">
                            <div class="product-item product-content">
                                <div class="product-item-img-ver6">
                                    <a href='Item.jsp?Id=<%= sp.getId()%>'>
                                        <img src='<%=sp.getAnh()%>' alt="img" class="img-responsive">
                                    </a>
                                </div>
                                <div class="product-item-ds">
                                    <p class="product-title"><%=sp.getTensp()%></p>

                                    <% if (sp.getGiamgia() > 0) {%>
                                    <div class="product-price"><%= sp.getGia() - sp.getGiamgia()%>đ<div class="product-price">Giá gốc: <%= sp.getGia()%>đ</div>
                                    </div>
                                    <div class="product-price"><%= sp.getGiamgia()%>đ</div>
                                    <% } else {%>
                                    <div class="product-price"><%= sp.getGia()%>đ</div>
                                    <%
                                        }
                                    %>
                                </div>

                            </div>
                                                           
                        </div>
                                 <%}%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

