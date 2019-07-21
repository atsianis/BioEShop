/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.dao.userDao;

import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.User;

/**
 *
 * @author samsung np350
 */
public interface InterfaceUserDao {
    
    public User getUserBySsoId(int id);
    
    public Customer getCustomerByEmail(String email);
    
    public boolean createAccount(User u);
    
    public boolean createCustomer(Customer c);
    
    public User getAccountByCustomomerId(int id);
    
    public Customer getCustomerById(int id);
    
    public boolean updateCustomer(Customer c);
    
    public boolean updateAccount(User u);
    
}
