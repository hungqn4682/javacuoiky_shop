<%-- 
    Document   : Product
    Created on : Dec 23, 2021, 3:32:53 PM
    Author     : The Bigger
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.qlbanhang.Model.Cart"%>
<%@page import="com.mycompany.qlbanhang.Model.sanpham"%>
<%@page import="com.mycompany.qlbanhang.DAO.sanphamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% sanphamDAO spDAO = new sanphamDAO();
    String madm = request.getParameter("madm");

    String page1 = "", page2 = "";
    int start = 0;
    int end;
    if (spDAO.getSP().size() < 10) {
        end = 5;
    } else {
        end = spDAO.getSP().size();
    }
    if (request.getParameter("start") != null) {
        page1 = request.getParameter("start");
        start = Integer.parseInt(page1);
    }
    if (request.getParameter("end") != null) {
        page2 = request.getParameter("end");
        end = Integer.parseInt(page2);
    }
    List<sanpham> list = spDAO.getlistProductByPagination(spDAO.getSP(), start, end);
%>
<div class="product-bestselling text-center">
    <div class="product-header">
        <h2>Danh mục</h2>

    </div>
    <div class="row">

        <% if (madm == null) {
                for (sanpham sp : list) {%>
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
        <%}
        } else {
            for (sanpham sptoDm : spDAO.getSpbyDm(madm)) {
        %>
        <div class="col-md-15 col-sm-4 col-xs-6">
            <div class="product-item product-content">
                <div class="product-item-img-ver6">
                    <a href='Item.jsp?Id=<%= sptoDm.getId()%>'>
                        <img src='<%=sptoDm.getAnh()%>' alt="img" class="img-responsive">
                    </a>
                </div>
                <div class="product-item-ds">
                    <p class="product-title"><%=sptoDm.getTensp()%></p>

                    <% if (sptoDm.getGiamgia() > 0) {%>
                    <div class="product-price"><%= sptoDm.getGia() - sptoDm.getGiamgia()%>đ<div class="product-price">Giá gốc: <%= sptoDm.getGia()%>đ</div>
                    </div>
                    <div class="product-price"><%= sptoDm.getGiamgia()%>đ</div>
                    <% } else {%>
                    <div class="product-price"><%= sptoDm.getGia()%>đ</div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <%}
      }%>

    </div>

    <div class="product-pagination">
        <ul class="pagination">
                
            <li>
                <a href="index.jsp"><i class="ion-chevron-left"></i></a>
            </li>
              <% int a, b;
      int limit = spDAO.getSP().size()/5;
      if(limit * 5 < spDAO.getSP().size()){
          limit +=1;
      }
      for(int i = 1; i<= limit;i++){
          a =(i-1)*5;
          b = i*5;
          if(b > spDAO.getSP().size()){
              b = spDAO.getSP().size();          
      }
      %>
            <li class="active"><a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>
            
            <%}%>
            <li>
                <a href="#"><i class="ion-chevron-right"></i></a>
            </li>
        </ul>
    </div>
</div>
