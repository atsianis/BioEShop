/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.dao;

import com.mycompany.bioeshop.entities.Customer;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("cdao")
@Transactional
public class CustomerDaoImpl extends AbstractDao<Integer, Customer> implements CustomerDao {
    
    // tested --> works
    @Override
    public boolean createCustomer(Customer c) {
        try {
            persist(c);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Customer getCustomerByEmail(String email) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("email", email));
        Customer c = (Customer) crit.uniqueResult();
        return c;
    }
    
    // tested --> works
    @Override
    public Customer getCustomerById(int id) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("customerId", id));
        Customer c = (Customer) crit.uniqueResult();
        return c;
    }

    @Override
    public boolean updateCustomer(Customer c) {
        try {
            update(c);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    @Override
    public Customer getCustomerBySsoId(String ssoId) {
        String sqlQuery = "select c from Customer c inner join c.userList u where u.ssoId ='" + ssoId + "'";
        Customer c =(Customer)getSession().createQuery(sqlQuery).uniqueResult();
        return c;
    }
    
    @Override
    public List<Customer> getAllRegisteredCustomers(){
        String query = "select c from Customer c right join c.userList";
        List<Customer> registeredCustomers = (List<Customer>)getSession().createQuery(query).list();
        return registeredCustomers;
    }
    
    public boolean deleteCustomerById(int id){
        try{
            Criteria crit = createEntityCriteria();
            crit.add(Restrictions.eq("customerId", id));
            Customer c = (Customer)crit.uniqueResult();
            delete(c);
            return true;
        }catch(Exception e){
            return false;
        }
    }
    
}
