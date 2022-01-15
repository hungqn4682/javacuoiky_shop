package com.mycompany.qlbanhang.DB;

import com.mycompany.qlbanhang.Model.danhmuc;



import com.mycompany.qlbanhang.Model.sanpham;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtils {

    public static final SessionFactory FACTORY;

    static {
        Configuration conf = new Configuration();
        conf.configure("hibernate.cfg.xml");

        conf.addAnnotatedClass(danhmuc.class);
        conf.addAnnotatedClass(sanpham.class);
        
        ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();

        FACTORY = conf.buildSessionFactory(reg);
    }

    public static SessionFactory getFactory() {
        return FACTORY;
    }
}
