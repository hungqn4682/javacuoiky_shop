/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.qlbanhang.DAO;

import com.mycompany.qlbanhang.DB.HibernateUtils;
import com.mycompany.qlbanhang.Model.sanpham;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author The Bigger
 */
public class sanphamDAO {

    private SessionFactory sessionFactory = HibernateUtils.getFactory();

    public List<sanpham> getSP() {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<sanpham> list = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("FROM sanpham ").list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<sanpham> getSpbyDm(String madm) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<sanpham> list = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("FROM sanpham where madm ='" + madm + "' ").list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

      public List<sanpham> getSpbyNsx(String mahang) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<sanpham> list = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("FROM sanpham where mahang ='" + mahang + "' ").list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
      
        public List<sanpham> getSpbySearch(String tensp) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<sanpham> list = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("FROM sanpham where tensp LIKE '%" + tensp  +"%'").list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    @SuppressWarnings("unchecked")
    public sanpham getSpbyId(int Id) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        sanpham sp = null;
        try {
            tx = session.beginTransaction();
            sp = (sanpham) session.createQuery("FROM sanpham where id ='" + Id + "'").uniqueResult();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return sp;
    }

  
     public List<sanpham> getSPbyhotSearch() {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List<sanpham> list = null;
        try {
            tx = session.beginTransaction();
            list = session.createQuery("FROM sanpham ORDER BY RAND ( ) ").setMaxResults(4).list();
            
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
public List<sanpham> getlistProductByPagination(List<sanpham> list,
        int start, int end) {
    List<sanpham> result = new ArrayList<sanpham>();
    for (int i = start; i < end; i++) {
        result.add(list.get(i));
    }
    return result;
    }

}
