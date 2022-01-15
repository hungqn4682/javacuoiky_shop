<%-- 
    Document   : Cart
    Created on : Jan 1, 2022, 11:52:20 AM
    Author     : The Bigger
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.mycompany.qlbanhang.Model.sanpham"%>
<%@page import="com.mycompany.qlbanhang.Model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <jsp:include page="link.jsp" />
    </head>
    <% Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        TreeMap<sanpham, Integer> list = cart.getListSanpham();
    %>
    <body>
        <!-- Header -->
        <jsp:include page="Searchbox.jsp" />
        <div class="page-left-sidebar">
            <jsp:include page="header.jsp" />
        </div>
        <div class="page-right-content">		
            <div class="container">

                <% if (cart != null) {%>
                <div class="heading-sub">
                    <h3 class="pull-left">shop cart</h3>
                    <ul class="other-link-sub pull-right">
                        <li><a href="#home">Home</a></li>
                        <li><a href="#shop">Shop</a></li>
                        <li><a class="active" href="#cart">Cart</a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div id="notify-msg">
                    <a href="javascript:history.back()">Quay lại</a>
                </div>

                <div id="notify-msg">
                    <a href="index.jsp">Tiếp tục mua hàng</a>
                </div>


                <div class="row">
                    <div class="col-md-8 col-sm-12">
                        <table class="table shop_table">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">IMAGE</th>
                                    <th class="product-name">Tên sản phẩm</th>
                                    <th class="quantity">Số lương</th>
                                    <th class="product-subtotal">Giá</th>
                                    <th class="product-subtotal"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Map.Entry<sanpham, Integer> entry : list.entrySet()) {%>
                                <tr class="cart_item">
                                    <td class="product-thumbnail"><img src="<%= entry.getKey().getAnh()%>"  alt="images" class="img-responsive" width="100px" height="75px"/></td>
                                    <td class="product-name">
                                        <span><%= entry.getKey().getTensp()%></span>
                                    </td>

                                    <td class="product-quantity">
                                        <div class="quantity">
                                            <input type="number" min="1" max="100" value="<%=entry.getValue()%>" name="quantity[<%=entry.getKey().getId()%>]"/>
                                        </div>
                                    </td>
                                    <td class="product-price">
                                        <h4 class="product-price">Giá: <%=entry.getValue() * (entry.getKey().getGia() - entry.getKey().getGiamgia())%>đ</h4>
                                    </td>
                                    <td class="product-name">
                                        <a href="CartController?action=removeItem&Id=<%=entry.getKey().getId()%>&cartID=<%=System.currentTimeMillis()%>">
                                            <p class="product-remove">
                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                <span class="remove">Xóa</span>
                                            </p>
                                        </a>
                                    </td>
                                </tr>

                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="aside-shopping-cart-total">
                            <h2>CART TOTALS</h2>
                            <ul>
                                <li><span class="text">Tạm tính:</span><span class="cart-number">Đ</span></li>
                                <li><span class="text">Giảm giá:</span> <span class="cart-number">Đ</span></span>
                                </li>
                                <li><span class="text calculate">Calculate</span>
                                </li>
                                <li><span class="text">Tổng tiền:</span><span class="cart-number big-total-number">Đ</span></li>
                            </ul>
                            <div class="process" id="form-button">
                                <button type="submit" class="btn-checkout" name="update_click">Cập nhật giỏ hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
                <form id="cart-form" action="CheckoutController" method="post" class="checkout-cart-form">
                    <div class="billing-details">
                        <div class="billing-details-heading">
                            <h2 class="billing-title">Billing Details</h2>
                        </div>
                        <div class="contact-form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6 col-sm-12"><label>Họ và Tên: </label><input class="form-control" type="text"  name="name" placeholder="Nhập họ và tên" /></div>
                                    <div class="col-md-6 col-sm-12"><label>Điện thoại: </label><input type="tel" class="form-control" pattern="0[0-9]*.[0-9]{6}"  name="phone" placeholder="Nhập số điện thoại" /></div>

                                    <div class="col-md-6 col-sm-12"><label>Email: </label><input type="email" class="form-control"  name="email" placeholder="Nhập email (đơn hàng sẽ gửi vào email)" /></div>
                                    <div class="col-md-6 col-sm-12"><label>Địa chỉ nhận: </label><input class="form-control" type="text"  name="address" placeholder="Nhập địa chỉ " /></div>

                                    <div class="col-md-12"> <label>Yêu cầu khác: </label><textarea name="note" id="message" tabindex="2" placeholder="Nhập yêu cầu (Không bắt buộc)" class="form-control"></textarea></div>
                                </div>
                            </div>
                            <div class="row">
                                <input type="submit" class="btn-update-cart" value="Đặt hàng" />
                                <div>
                                </div>
                            </div> 
                        </div>

                    </div>
                </form>
                <%} else {%>

                <div class="text-center">
                    <p>Không có sản phẩn nào trong giỏ hàng của bạn</p>
                </div>

                <%}%>
            </div>
        </div>
    </body>

</html>
