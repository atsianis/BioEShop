package com.mycompany.bioeshop.dao;

import com.mycompany.bioeshop.entities.Customer;
import java.util.List;

import com.mycompany.bioeshop.entities.User;


public interface UserDao {

	User findById(int id);
	
	User findBySSO(String sso);
	
	void save(User user);
	
	void deleteBySSO(String sso);
	
	List<User> findAllUsers();
        
        ///// Extra //////////////
        
        public Customer getCustomerByEmail(String email);
        
        public boolean createAccount(User u);
    
        public boolean createCustomer(Customer c);

        public User getAccountByCustomomerId(int id);

        public Customer getCustomerById(int id);

        public boolean updateCustomer(Customer c);

        public boolean updateAccount(User u);

}

