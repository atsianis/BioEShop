
package com.mycompany.bioeshop.service;

import com.mycompany.bioeshop.entities.Customer;
import java.util.List;

public interface CustomerService {
    
    public boolean createCustomer(Customer c);
    
    public int saveCustomer(Customer c);
    
    public Customer getCustomerByEmail(String email);
    
    public Customer getCustomerById(int id);

    public boolean updateCustomer(Customer c);
    
    public boolean isEmailUnique(Integer id, String email);
    
    public Customer getCustomerBySsoId(String ssoId);
    
    public Customer updateCustomer(Customer newCustomer, Customer oldCustomer);
}
