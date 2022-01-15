<%-- 
    Document   : header
    Created on : Dec 21, 2021, 11:47:10 PM
    Author     : The Bigger
--%>

<%@page import="com.mycompany.qlbanhang.DB.HibernateUtils"%>
<%@page import="com.mycompany.qlbanhang.Model.danhmuc"%>
<%@page import="com.mycompany.qlbanhang.DAO.danhmucDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="navbar-wrapper js-navbar-wrapper">
	<div class="navbar-control js-navbar-control">
		<div class="navbar-header">
			<a href="index.jsp"><img src="image/logo1.png" alt="images" class="img-responsive"/></a>
		</div>
		<div class="navbar-button js-navbar-button">
            <div class="bars js-bars">
              <a>
                <i class="ion-android-menu icon-mobile"></i>
              </a>
            </div>
          </div>
		<div class="navbar-meta js-navbar-meta">
			<div class="search-ver6 dropdown" data-toggle="modal" data-target="#myModal">
				<i class="ion-ios-search"></i>
			</div>
			<div class="cart v6 js-cart">
				<a href='Cart.jsp'>
					<div class="photo">
						<img src="image/cart.png" alt="images" class="img-reponsive">
						<span class="lbl v6">0</span>
					</div>
				</a>
			</div>
		</div>
	</div>

	<div class="navbar__content">
		<div id="bars" class="navbar__container js-container">
			<div class="navbar__wrap">
			<ul class="level">
                            <% danhmucDAO danhmucDAO = new danhmucDAO(); %>
                            <% for (danhmuc dm : danhmucDAO.getDm()){ %>
                            <li><a href="index.jsp?madm=<%=dm.getMadm()%>"><b><%=dm.getTendm()%></b></a></li>
				 <%}%>	
				
					<li><a  href="../admin/" title="ADMIN"><b>Đăng Nhập</b></a></li>				

				</ul>
                           
			</div>
		</div>
	</div>
</div>
