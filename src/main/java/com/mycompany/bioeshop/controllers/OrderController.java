package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.dao.OrderDao;
import com.mycompany.bioeshop.dao.ProductDao;
import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.Order$;
import com.mycompany.bioeshop.entities.OrderDetails;
import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.service.CustomerService;
import com.mycompany.bioeshop.service.OrderService;
import com.mycompany.bioeshop.service.ProductsService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    CustomerService customerService;
    
    @Autowired
    OrderService orderService;

    @Autowired
    ProductsService productService;
    
    @Autowired
    ProductDao pdao;

    @Autowired
    OrderDao odao;

    @RequestMapping(value = {"/buy/{id}"}, method = RequestMethod.GET)
    public String newOrder(ModelMap model, @PathVariable int id) {
        Customer c;
        boolean isRegistered;
        String username = getPrincipal();
        if (username == "anonymousUser") {
            c = new Customer();
            isRegistered = false;
        } else {
            c = customerService.getCustomerBySsoId(username);
            isRegistered = true;
        }
        Order$ o = new Order$();
        Product p = productService.getProductById(id);
        

        List<OrderDetails> list = new ArrayList();
        o.setOrderDetailsList(list);

        // se synthikes agoras pollaplwn proiontwn tha eftiaxna tosa
        // orderdetails objects osa kai ta diaforerikou eidous products tis paraggelias
        OrderDetails odetails = new OrderDetails();
        odetails.setProduct(p);
//        list.add(odetails);
//        System.out.println("orderDetailsList:"+ list);

        o.addOrderDetailsToList(odetails);
        o.setCustomer(c);
        o.setPending((short) 1);
//        Hibernate.initialize(o.getOrderDetailsList());
        // mesa stin post na setarw kai date !
        model.addAttribute("order", o);
        model.addAttribute("action", "order/save");
        model.addAttribute("registered", isRegistered);
        model.addAttribute("loggedinuser", getPrincipal());
        return "view_buynow";
    }

    @RequestMapping(value = {"/save"}, method = RequestMethod.POST)
    public String newOrder(@ModelAttribute("order") Order$ order,
            @RequestParam(value = "pid", required = false) List<Integer> pid,
            @RequestParam(value = "quantity", required = false) List<Integer> quantity,
            BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            model.addAttribute("message", "problem");
            return "home";
        }
        
        /**
         * If the Order Id is null, then the new order is processed.
         * If not, then an existing order is updated.
         */
        if (order.getOrderId() == null) {
            Customer c = order.getCustomer();
            // If the customer buys as a visitor, he has null id
            if (c.getCustomerId() == null) {
                // Checking if the visitor customer exists in the database, by the email he gave
                Customer existingCustomer = customerService.getCustomerByEmail(c.getEmail());
                if (existingCustomer != null) {                                               // if the visitor customer already exists
                    existingCustomer = customerService.updateCustomer(c, existingCustomer);    // updating customer's info
                    c.setCustomerId(existingCustomer.getCustomerId());                        // setting customer for order
                } else {
                    c.setCustomerId(customerService.saveCustomer(c));                        // setting customer for order
                    order.setCustomer(c);
                }
            }
            //set order time
            Date date = new Date(System.currentTimeMillis());
            order.setDate(date);
            // create a list of details
            int orderLength = pid.size();
            List<OrderDetails> list = new ArrayList();
            OrderDetails od;
            for (int i = 0; i < orderLength; i++) {
                od = new OrderDetails();
                od.setOrder(order);
                list.add(od);
            }
            // link the list with the order 
            order.setOrderDetailsList(list);
            // for every element in the list of order details we have to set the product and the quantity
            // theoretically we have a list of products and a list of quantitiew from the requests param
            // so this code might be expandable for an order with multiple products
            // for now it has only been tested with one
            Product p;
            int q;
            for (int i = 0; i < orderLength; i++) {
                p = productService.getProductById(pid.get(i));
                q = quantity.get(i);
                order.getOrderDetailsList().get(i).setProduct(p);
                order.getOrderDetailsList().get(i).setQuantity(q);
                p.setStock(p.getStock() - q);
                productService.updateProduct(p);
            }
            boolean created = orderService.createOrder(order);
            if (created) {
                model.addAttribute("message", "Dear " + order.getCustomer().getFname() + ", your ordered has been placed");
            } else {
                model.addAttribute("message", "Sorry, there was a problem with your order");

            }

            return "ordersuccess";
            /**
             * If Order Id is NOT null, then an existing order is updated
             * by the administrator.
             */
        } else {
            Customer c = order.getCustomer();
            Customer existingCustomer = customerService.getCustomerById(c.getCustomerId());
            if(!(c.equals(existingCustomer))) {
                existingCustomer = customerService.updateCustomer(c, existingCustomer);
                order.setCustomer(existingCustomer);
            }
            
            if(orderService.updateOrder(order)) {
                model.addAttribute("message", "The order was updated successfully");
                return "ordersuccess";
            } else {
                model.addAttribute("message", "Sorry, the order failed to update.");
                return "ordersuccess";
            }
        }
    }
//    @ModelAttribute("order")
//    public Order$ inorder(){
//        return new Order$();
//    }

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
