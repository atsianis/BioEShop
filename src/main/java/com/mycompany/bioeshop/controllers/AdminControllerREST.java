/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.entities.Order$;
import com.mycompany.bioeshop.entities.OrderDetails;
import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.service.OrderService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Hibernate;
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
@RequestMapping("/admin/api")
public class AdminControllerREST {
    
    @Autowired
    OrderService orderService;
    
    
    
   @RequestMapping(value = {"/orders/{something}"}, method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> getOrders(@PathVariable String something) {
        
        List<Order$> orders = new ArrayList();
        Map<String, Object> response = new HashMap();
        
        switch (something) {
            case "pending":
                orders = orderService.getPendingOrders();
                break;
            case "done":
                orders = orderService.getDoneOrders();
                break;
            default:
                
                Order$ o = orderService.getOrderById(Integer.parseInt(something));
                System.out.println("/////////////////////////");
                System.out.println(o);
                orders.add(o);
                break;
        }
        
        response.put("orders", orders);

        if (orders.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}