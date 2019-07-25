/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
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
        model.addAttribute("products", productsService.getProductByCategory(category));
        String pagetitle = "";
        if(category.equals("cup")){
            pagetitle = "Cups made by nature";
        } else if(category.equals("straw")) {
            pagetitle = "No more plastic straws!";
        } else {
            pagetitle = "Shinny smiles, with these cool toothbrushes!";
        }
        model.addAttribute("pagetitle", pagetitle);
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



}
