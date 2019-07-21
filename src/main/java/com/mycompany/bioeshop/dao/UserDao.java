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
        
        //public boolean createAccount(User u); // einai to save stin ousia
        
        public User getAccountByCustomomerId(int id);
        
        public boolean updateAccount(User u);

}

