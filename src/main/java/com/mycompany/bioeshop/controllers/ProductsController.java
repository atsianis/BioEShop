/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.service.ProductsService;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author giorgos
 */
@Controller
@RequestMapping("/products")
@SessionAttributes("roles")
public class ProductsController {

    @Autowired
    ProductsService productsService;    
      
    @RequestMapping(value = {"/", "/{something}"}, method = RequestMethod.GET)
    public String getProductsOfCategory(ModelMap model ) {
        model.addAttribute("loggedinuser", getPrincipal());        
        return "view_product";
    }
    
//    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
//    public String getProductsFiltered(ModelMap model, @PathVariable int id) {
//        model.addAttribute("loggedinuser", getPrincipal());
//        return "view_product";
//    }
    
    

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
