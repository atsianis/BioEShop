/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.User;
import com.mycompany.bioeshop.service.CustomerService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @RequestMapping(value = {"/profile/update/{id}"}, method = RequestMethod.GET)
    public String updateProfile(ModelMap model, @PathVariable String id) {
        model.addAttribute("customer", customerService.getCustomerById(Integer.parseInt(id)));
        return "updateprofile";
    }

    @RequestMapping(value = {"/profile/save"}, method = RequestMethod.POST)
    public String saveProfile(@Valid Customer customer, BindingResult result,
            ModelMap model, @RequestParam("oldemail") String oldemail) {
        
        if (result.hasErrors()) {
            return "updateprofile";
        }
        
        if(!oldemail.equals(customer.getEmail())) {
            if (!customerService.isEmailUnique(customer.getCustomerId(), customer.getEmail())) {
                model.addAttribute("emailnotUnique", "Email " + customer.getEmail()
                        + " already exists. Please fill in a different email.");
                return "updateprofile";
            }
        }
        
        if(customerService.updateCustomer(customer)){
            return "redirect:/user/profile";
        }
        
        // It should redirect to a different jsp
        model.addAttribute("success", "Your info was not updated.");
        return "redirect:/user/profile";
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
