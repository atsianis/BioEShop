package com.mycompany.bioeshop.dao;

import java.util.List;

import com.mycompany.bioeshop.entities.UserProfile;


public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
