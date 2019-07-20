package com.mycompany.bioeshop.service;

import java.util.List;

import com.mycompany.bioeshop.entities.UserProfile;


public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);
	
	List<UserProfile> findAll();
	
}
