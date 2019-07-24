/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author giorgos
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("roles")
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @RequestMapping(value = {"/profile"}, method = RequestMethod.GET)
    public String getProfile(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("customer", customerService.getCustomerBySsoId(getPrincipal()));
        return "myprofile";
    }

    @RequestMapping(value = {"/profile/update"}, method = RequestMethod.GET)
    public String updateProfile(ModelMap model) {

        return "";
    }

    @RequestMapping(value = {"/profile/update"}, method = RequestMethod.POST)
    public String saveProfile(ModelMap model) {

        return "";
    }

    @RequestMapping(value = {"/profile/myorders"}, method = RequestMethod.GET)
    public String getOrders(ModelMap model) {

        return "";
    }

    /**
     * This method returns the principal[user-name] of logged-in user.
     */
    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

}
