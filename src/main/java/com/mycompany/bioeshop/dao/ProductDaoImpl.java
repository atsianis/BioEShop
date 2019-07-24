/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.dao;

import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.entities.User;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author samsung np350
 */
public class ProductDaoImpl extends AbstractDao<Integer,Product> implements ProductDao {

    @Override
    public List<Product> getAllProducts() {
        Criteria criteria = createEntityCriteria();
        List<Product> products = (List<Product>) criteria.list();
        for (Product p : products){
            Hibernate.initialize(p.getOrderdetailsList());
        }
        return products;
    }

    @Override
    public List<Product> getProductByCategory(String category) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("category", category));
	List<Product> list = (List<Product>)crit.list()
        return list;
    }

    @Override
    public Product getProductById() {
    }
    
}
