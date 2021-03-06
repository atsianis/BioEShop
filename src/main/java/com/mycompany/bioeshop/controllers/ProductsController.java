/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.service.AppService;
import com.mycompany.bioeshop.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    AppService appService;

    @Autowired
    ProductsService productsService;    
      
    @RequestMapping(value = {"", "/", "/{something}"}, method = RequestMethod.GET)
    public String getProductsOfCategory(ModelMap model, @ModelAttribute("message") String message) {
        model.addAttribute("message", message);
        model.addAttribute("pagetitle", "Products");
        model.addAttribute("loggedinuser", appService.getPrincipal());        
        return "view_product";
    }
    

}
