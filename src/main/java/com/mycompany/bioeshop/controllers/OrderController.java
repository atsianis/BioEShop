
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.dao.ProductDao;
import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.Order$;
import com.mycompany.bioeshop.entities.OrderDetails;
import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.service.CustomerService;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/order")
public class OrderController {
    
    @Autowired
    CustomerService customerService;
    
    @Autowired
    ProductDao pdao;
    
    @RequestMapping(value = {"/buy/{id}"}, method = RequestMethod.GET)
    public String newOrder(ModelMap model,@PathVariable int id) {
        Order$ o = new Order$();
        Customer c = customerService.getCustomerBySsoId(getPrincipal());
        Product p = pdao.getProductById(id);
        
        List<OrderDetails> list = new ArrayList();
        // se synthikes agoras pollaplwn proiontwn tha eftiaxna tosa
        // orderdetails objects osa kai ta diaforerikou eidous products tis paraggelias
        OrderDetails odetails = new OrderDetails();
        odetails.setProduct(p);
        list.add(odetails);
        
        o.setOrderDetailsList(list);
        o.setCustomer(c);
        o.setPending((short)1);
//        Hibernate.initialize(o.getOrderDetailsList());
        // mesa stin post na setarw kai date !
        model.addAttribute("order",o);
        model.addAttribute("action", "user/order/save");
        System.out.println(o.getOrderDetailsList());
        return "buynow";
    }
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
