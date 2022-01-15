/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.qlbanhang.Controller;

import DB.DBConnection;
import com.mycompany.qlbanhang.DAO.orderDAO;
import com.mycompany.qlbanhang.DAO.order_detailDAO;
import com.mycompany.qlbanhang.Model.Cart;
import com.mycompany.qlbanhang.Model.order;
import com.mycompany.qlbanhang.Model.order_detail;
import com.mycompany.qlbanhang.Model.sanpham;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author The Bigger
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final orderDAO hoadonDAO = new orderDAO();
    private final order_detailDAO cthdDAO = new order_detailDAO();

    public CheckoutController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = DBConnection.CreateConnection();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
  String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
      

        ArrayList<Long> listbuy = (ArrayList<Long>) session.getAttribute("cartID");
         long idBuy = 0;
            if (request.getParameter("cartID") != null) {
                idBuy = Long.parseLong(request.getParameter("cartID"));
            }
        if (listbuy == null) {
            listbuy = new ArrayList<Long>();
            session.setAttribute("cartID", listbuy);
        }
        try {
            order hd = null;
            order_detail cthd = null;
             if (listbuy.indexOf(idBuy) == -1) {
            int total = 0;
            TreeMap<sanpham, Integer> list = cart.getListSanpham();
            for (Map.Entry<sanpham, Integer> entry : list.entrySet()) {
                total += entry.getValue() * Math.round(entry.getKey().getGia() - entry.getKey().getGiamgia());
            }
            hd = new order(name, phone, address, email, note, total);
            int hd_id = hoadonDAO.themOrder(conn, hd);

            for (Map.Entry<sanpham, Integer> entry : list.entrySet()) {
                cthd = new order_detail(hd_id, entry.getKey().getId(), entry.getValue(),
                        Math.round(entry.getKey().getGia() - entry.getKey().getGiamgia()));
                cthdDAO.themCthd(conn, cthd);
            }

            session.removeAttribute("cart");
            session.setAttribute("cart", new Cart());
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
       RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/checkout.jsp");
            rd.forward(request, response);
    }

}
