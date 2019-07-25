
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.dao.ProductDao;
import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.service.CustomerService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author samsung np350
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    ProductDao pdao;
    
    @RequestMapping(value = {"/products/edit/{id}"}, method = RequestMethod.GET)
    public String editProduct(ModelMap model,@PathVariable String id){
        Product p = pdao.getProductById(Integer.parseInt(id));
        model.addAttribute("edit",true);
        model.addAttribute("p", p);
        return "saveeditproduct";
        
    }
    
    @RequestMapping(value = {"/products/save"}, method = RequestMethod.GET)
    public String newProduct(ModelMap model){
        Product p = new Product();
        model.addAttribute("edit",false);
        model.addAttribute("p", p);
        return "saveeditproduct";
        
    }
    
    @RequestMapping(value = {"/products/save"}, method = RequestMethod.POST)
    public String saveProduct(@Valid Product p, BindingResult result,
            ModelMap model){
        
        if (result.hasErrors()) {
            model.addAttribute("message","There was an error trying to save. Please try again");
            return "products";
        }
        boolean done = false;
        if(p.getProductId()==null){
            done = pdao.addProduct(p);
        }else{
            done = pdao.updateProduct(p);
        }
        // pithana minimata pou mporoun na emfanizontai kapou kapote. Twra de ta xeirizomai
        if (done) {
            model.addAttribute("message","Entry done");
        }else{
            model.addAttribute("message","There was a problem");
        }
        return "products";
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
