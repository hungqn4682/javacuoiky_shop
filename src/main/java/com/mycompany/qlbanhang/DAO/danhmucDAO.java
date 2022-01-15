/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.qlbanhang.DAO;

import com.mycompany.qlbanhang.DB.HibernateUtils;
import com.mycompany.qlbanhang.Model.danhmuc;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;




/**
 *
 * @author The Bigger
 */
public class danhmucDAO {
    private SessionFactory sessionFactory = HibernateUtils.getFactory();


public List<danhmuc> getDm() {
   Session session = sessionFactory.openSession();
   Transaction tx = null;
   List<danhmuc> list = null;
   try {
       tx = session.beginTransaction();
       list = session.createQuery("FROM danhmuc ").list();
       tx.commit();
     } catch (HibernateException e) {
       if (tx != null)
           tx.rollback();
       e.printStackTrace();
    } finally {
       session.close();
   }
   return list;
}
}