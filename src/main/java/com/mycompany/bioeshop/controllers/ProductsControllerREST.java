/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.service.ProductsService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author giorgos
 */
@RestController
@RequestMapping("/products/api")
public class ProductsControllerREST {

    @Autowired
    ProductsService productsService;

    @RequestMapping(value = {"/{category}"}, method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> getProductsOfCategory(@PathVariable String category) {
        
        List<Product> products = new ArrayList();
        Map<String, Object> response = new HashMap();
        
        switch (category) {
            case "all":
                products = productsService.getAllProducts();
                break;
            case "cup":
            case "straw":
            case "toothbrush":
                products = productsService.getProductByCategory(category);
                response.put("category", category);
                break;
            default:
                try {
                    Product p = productsService.getProductById(Integer.parseInt(category));
                    products.add(p);
                } catch(NumberFormatException e){
                    e.printStackTrace();
                    return new ResponseEntity<>(HttpStatus.NO_CONTENT);
                } finally {
                    break;
                }
        }
        
        response.put("products", products);

        if (products.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
