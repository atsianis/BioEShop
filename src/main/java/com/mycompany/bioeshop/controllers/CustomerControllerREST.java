/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.Order$;
import com.mycompany.bioeshop.service.AppService;
import com.mycompany.bioeshop.service.CustomerService;
import com.mycompany.bioeshop.service.OrderService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author samsung np350
 */
@RestController
@RequestMapping("/user/api")
public class CustomerControllerREST {

    @Autowired
    AppService appService;

    @Autowired
    OrderService orderService;

    @Autowired
    CustomerService csrv;

    @Autowired
    OrderService osrv;

    @RequestMapping(value = {"/orders"}, method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> getOrders() {
        Map<String, Object> response = new HashMap();
        Customer customer = csrv.getCustomerBySsoId(appService.getPrincipal());
        List<Order$> orders = osrv.getOrdersForCustomerById(customer.getCustomerId());
        response.put("orders", orders);

        if (orders.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
