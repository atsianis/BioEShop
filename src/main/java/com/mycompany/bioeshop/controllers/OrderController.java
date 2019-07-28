
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.dao.OrderDao;
import com.mycompany.bioeshop.dao.ProductDao;
import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.Order$;
import com.mycompany.bioeshop.entities.OrderDetails;
import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.service.CustomerService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.validation.Valid;
import org.hibernate.Hibernate;
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
@RequestMapping("user/order")
public class OrderController {
    
    @Autowired
    CustomerService customerService;
    
    @Autowired
    ProductDao pdao;
    
    @Autowired
    OrderDao odao;
    
    @RequestMapping(value = {"/buy/{id}"}, method = RequestMethod.GET)
    public String newOrder(ModelMap model,@PathVariable int id) {
        Order$ o = new Order$();
        Customer c = customerService.getCustomerBySsoId(getPrincipal());
        Product p = pdao.getProductById(id);
        
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
        o.setPending((short)1);
//        Hibernate.initialize(o.getOrderDetailsList());
        // mesa stin post na setarw kai date !
        model.addAttribute("order",o);
        model.addAttribute("action", "user/order/save");
        return "buynow";
    }
    
    @RequestMapping(value = {"/save"}, method = RequestMethod.POST)
    public String newOrder(@ModelAttribute("order") Order$ order,@RequestParam("pid") List<Integer> pid,@RequestParam("quantity") List<Integer> quantity, BindingResult result,
            ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("message","problem");
            return "home";
        }
        //set order time
        Date date = new Date(System.currentTimeMillis());
        order.setDate(date);
        // create a list of details
        int orderLength = pid.size();
        List<OrderDetails> list= new ArrayList();
        OrderDetails od;
        for( int i=0;i<orderLength;i++){
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
        for (int i=0;i<orderLength;i++){
            order.getOrderDetailsList().get(i).setProduct(pdao.getProductById(pid.get(i)));
            order.getOrderDetailsList().get(i).setQuantity(quantity.get(i));
        }
        boolean created = odao.createOrder(order);
        if(created){
                model.addAttribute("message", "Dear "+order.getCustomer().getFname()+", your ordered has been placed");
            }else{
                model.addAttribute("message", "Sorry, there was a problem with your order");
                
        }
        
        return "ordersuccess";
        
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
