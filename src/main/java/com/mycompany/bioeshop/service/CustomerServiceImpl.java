/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.service;

import com.mycompany.bioeshop.dao.CustomerDao;
import com.mycompany.bioeshop.dao.CustomerDaoImpl;
import com.mycompany.bioeshop.entities.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author samsung np350
 */
@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao cdao;

    @Override
    public boolean createCustomer(Customer c) {
        return true;
    }

    @Override
    public Customer getCustomerByEmail(String email) {
        return cdao.getCustomerByEmail(email);
    }

    @Override
    public Customer getCustomerById(int id) {
        return cdao.getCustomerById(id);
    }

    @Override
    public boolean updateCustomer(Customer c) {
        return cdao.updateCustomer(c);
    }

    public boolean isEmailUnique(Integer id, String email) {
        Customer customer = getCustomerByEmail(email);
        return ( customer == null || ((id != null) && (customer.getCustomerId() == id)));
    }
}
