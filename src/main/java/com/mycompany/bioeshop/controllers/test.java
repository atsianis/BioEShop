/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.dao.CustomerDao;
import com.mycompany.bioeshop.entities.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author giorgos
 */
@Controller
@RequestMapping("/")
public class test {

    @Autowired
    CustomerDao cdao;

    @RequestMapping(value="/xxx",method = RequestMethod.GET)
    public String Testing(ModelMap model) {
        Customer c = cdao.getCustomerById(2);
        model.addAttribute("variable",c);
        return "testview";
    }
}
