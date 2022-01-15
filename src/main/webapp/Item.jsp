<%-- 
    Document   : Item
    Created on : Dec 23, 2021, 4:02:44 PM
    Author     : The Bigger
--%>

<%@page import="com.mycompany.qlbanhang.Model.Cart"%>
<%@page import="com.mycompany.qlbanhang.Model.sanpham"%>
<%@page import="com.mycompany.qlbanhang.DAO.sanphamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
        <jsp:include page="link.jsp" />  
    </head>
    <body>
        <%
            sanphamDAO spDAO = new sanphamDAO();
            String Id = request.getParameter("Id");
            int msp = Integer.parseInt(Id);
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <jsp:include page="Searchbox.jsp" />
        <div class="page-left-sidebar">
            <jsp:include page="header.jsp" />
        </div>
        <div class="page-right-content">
            <div class="container">
                <div class="heading-sub">
                    <h3 class="pull-left">shop single</h3>
                    <ul class="other-link-sub pull-right">
                        <li><a href="index.php">Home</a></li>
                        <li><a href="index.php">Shop</a></li>
                        <li><a class="active" href="#detail">Detail</a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="widget-shop-single">

                    <div class="row">

                        <div class="col-md-5">
                            <div class="shop-single-item-img">
                                <div class="main-img">

                                    <div class="main-img-item">
                                        <img src='<%=spDAO.getSpbyId(msp).getAnh()%>' width="400px" height="400px" alt="images" class="img-responsive" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="shop-sing-item-detail">
                                <form action="CartController?action=addToCart&Id=<%=spDAO.getSpbyId(msp).getId()%>&cartID=<%=System.currentTimeMillis()%>" method="POST">

                                    <h3 style="color:DodgerBlue;"><%=spDAO.getSpbyId(msp).getTensp()%></h3>

                                    <% if (spDAO.getSpbyId(msp).getSoluong() > 0) { %>
                                    <div class="brandname">
                                        <p style="border:2px solid DodgerBlue;width: 165px;"><b>Tình trạng:còn hàng </b></p>
                                    </div>
                                    <%} else { %>
                                    <p style="border:2px solid DodgerBlue;width: 198px;"><b>Tình trạng:tạm hết hàng </b></p>
                                    <%
                                        }
                                    %>

                                    <div class="description">
                                        <div class="prod-price">
                                            <% if (spDAO.getSpbyId(msp).getGiamgia() > 0) {%>
                                            <span class="price old"><b style="color:rgb(60, 60, 60)">Giá niêm yết: <del><%= spDAO.getSpbyId(msp).getGia()%>đ</del></b></span>
                                            <span class="price"><b style="color:rgb(255,0,0)"><%= spDAO.getSpbyId(msp).getGia() - spDAO.getSpbyId(msp).getGiamgia()%>đ</b></span>
                                            <% } else {%>
                                            <span class="price"><b style="color:rgb(255,0,0)">Giá: <%= spDAO.getSpbyId(msp).getGia()%>đ</b></span>
                                            <%
                                                }
                                            %>

                                        </div>
                                    </div>
                                    <div class="group-button">

                                        <input type="number" value="1" id="quantity" name="quantity[<%=spDAO.getSpbyId(msp).getId()%>]" min="1" max="100">

                                        <input type="submit" value="Mua sản phẩm" style="padding: 15px; margin-left: 10px; border-radius:5px;" class="btn btn-success" />

                                    </div>
                                </form>


                            </div>
                        </div>
                    </div>
                    <div class="product-detail-bottom">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a data-toggle="tab" href="#desc">Description</a>
                            </li>
                            <li><a data-toggle="tab" href="#review">Reviews</a></li>
                        </ul>
                        <div class="tab-content padding-lr">
                            <div id="desc" class="tab-pane fade in active">
                                <p>
                                    <?= $row['mota'] ?>
                                </p>
                            </div>
                            <div id="review" class="tab-pane fade">
                                <p>
                                    <?= $row['mota'] ?>
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="related-product-page">
                    <div class="heading-shop">
                        <h3>Có thể bạn thích?</h3>
                    </div>
                    <div class="widget-product-related">
                        <div class="owl-carousel owl-theme js-owl-product">
                            <% for (sanpham list : spDAO.getSPbyhotSearch()) {
                            %>
                            <div class="product-item">
                                <div class="product-item-img-related prod-item-img">
                                    <a href='Item.jsp?Id=<%= list.getId()%>'>
                                        <img src='<%=list.getAnh()%>' alt="img" class="img-responsive">
                                        <div class="product-item-info-related">
                                            <h3><%=list.getTensp()%></h3>
                                            <% if (list.getGiamgia() > 0) {%>
                                            <p><span class="price old">Giá niêm yết: <del><%= list.getGia()%>đ</del></span></p>
                                            <span class='price black'>Giảm:<%= list.getGiamgia()%>đ</span>
                                            <p><span class="price">Giảm còn:<%= list.getGia() - list.getGiamgia()%>đ</span></p>
                                            <% } else {%>
                                            <span class="price">Giá:<%= list.getGia()%>đ</span>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <%}%>
                        </div>                        
                    </div>
                </div>
            </div>          
        </div>
    </body>
</html>
