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

    @RequestMapping(value = {"/{category}"}, method = RequestMethod.GET)
    public String getProductsOfCategory(ModelMap model, @PathVariable String category) {

        List<Product> products = productsService.getProductByCategory(category);

        model.addAttribute("products", products);
        model.addAttribute("category", category);
        model.addAttribute("loggedinuser", getPrincipal());

        String pagetitle = "";
        if (category.equals("cup")) {
            pagetitle = "Cups made by nature";
        } else if (category.equals("straw")) {
            pagetitle = "No more plastic straws!";
        } else {
            pagetitle = "Shinny smiles, with these cool toothbrushes!";
        }
        model.addAttribute("pagetitle", pagetitle);

        double minPrice = 100000;
        double maxPrice = 0;
        Set<String> colors = new TreeSet();
        Set<String> sizes = new TreeSet();
        Set<String> materials = new TreeSet();

        for (Product p : products) {
            if (minPrice > p.getPrice()) {
                minPrice = p.getPrice();
            }
            if (maxPrice < p.getPrice()) {
                maxPrice = p.getPrice();
            }

            colors.add(p.getColor());
            sizes.add(p.getSize());
            materials.add(p.getMaterial());
        }
        
        double step = (maxPrice - minPrice) / 10;
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        model.addAttribute("step", step);
        model.addAttribute("colors", colors);
        model.addAttribute("sizes", sizes);
        model.addAttribute("materials", materials);
        
        return "products";
    }

//    @RequestMapping(value = {"/{category}/{filter}"}, method = RequestMethod.GET)
//    public String getProductsFiltered(ModelMap model, @PathVariable String category, @PathVariable String filter) {
//        
//        return "";
//    }
    @RequestMapping(value = {"/{category}/{id}"}, method = RequestMethod.GET)
    public String getProductsFiltered(ModelMap model, @PathVariable String category, @PathVariable String id) {

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
