
package com.mycompany.bioeshop.service;

import com.mycompany.bioeshop.entities.Customer;

public interface CustomerService {
    
    public boolean createCustomer(Customer c);
    
    public Customer getCustomerByEmail(String email);
    
    public Customer getCustomerById(int id);

    public boolean updateCustomer(Customer c);
    
    public boolean isEmailUnique(Integer id, String email);
}
