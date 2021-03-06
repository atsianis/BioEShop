/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.dao;

import com.mycompany.bioeshop.entities.Customer;
import java.util.List;

/**
 *
 * @author samsung np350
 */
public interface CustomerDao {
    
    public boolean createCustomer(Customer c);
    
    public int saveCustomer(Customer c);
    
    public Customer getCustomerByEmail(String email);
    
    public Customer getCustomerById(int id);

    public boolean updateCustomer(Customer c);
    
    public Customer getCustomerBySsoId(String ssoId);
    
    public List<Customer> getAllRegisteredCustomers();
    
    public List<Customer> getAllCustomers();
    
    public Customer getCustomerByUserId(int id);
    
    public boolean isRegisteredUser(Customer c);
    
    public boolean deleteCustomerById(int id);
    
}
