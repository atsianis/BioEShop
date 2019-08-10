package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.dao.CustomerDao;
import com.mycompany.bioeshop.dao.ProductDao;
import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.Product;
import com.mycompany.bioeshop.service.CustomerService;
import com.mycompany.bioeshop.service.OrderService;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author samsung np350
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    ProductDao pdao;

    @Autowired
    CustomerDao cdao;

    @Autowired
    CustomerService customerService;

    @Autowired
    OrderService orderService;

    @RequestMapping(value = {"/profile"}, method = RequestMethod.GET)
    public String getProfile(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("customer", customerService.getCustomerBySsoId(getPrincipal()));
        model.addAttribute("pagetitle", "My profile");
        model.addAttribute("adminForAdmin", true);
        return "customer_profile";
    }

    @RequestMapping(value = {"/profile/update"}, method = RequestMethod.GET)
    public String updateProfile(ModelMap model) {
        model.addAttribute("customer", customerService.getCustomerBySsoId(getPrincipal()));
        model.addAttribute("action", "/BioEShop/user/profile/save");
        model.addAttribute("cancel", "../BioEShop/admin/profile");
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Edit profile");
        model.addAttribute("adminForAdmin", true);
        return "updateprofile";
    }

    @RequestMapping(value = {"/profile/save"}, method = RequestMethod.POST)
    public String saveProfile(@Valid Customer customer, BindingResult result,
            ModelMap model, @RequestParam("oldemail") String oldemail) {

        if (result.hasErrors()) {
            model.addAttribute("loggedinuser", getPrincipal());
            model.addAttribute("pagetitle", "Edit profile");
            model.addAttribute("adminForAdmin", true);
            return "updateprofile";
        }

        if (!oldemail.equals(customer.getEmail())) {
            if (!customerService.isEmailUnique(customer.getCustomerId(), customer.getEmail())) {
                model.addAttribute("emailnotUnique", "Email " + customer.getEmail()
                        + " already exists. Please fill in a different email.");
                model.addAttribute("loggedinuser", getPrincipal());
                model.addAttribute("pagetitle", "Edit profile");
                model.addAttribute("adminForAdmin", true);
                return "updateprofile";
            }
        }

        if (customerService.updateCustomer(customer)) {
            model.addAttribute("success", "Your info was updated successfully.");
        } else {
            model.addAttribute("success", "Your info was not updated.");
        }
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "My profile");
        model.addAttribute("adminForAdmin", true);
        return "customer_profile";
    }

    @RequestMapping(value = {"/products/edit/{id}"}, method = RequestMethod.GET)
    public String editProduct(ModelMap model, @PathVariable String id) {
        try {
            Product p = pdao.getProductById(Integer.parseInt(id));
            String category = p.getCategory();
            model.addAttribute("p", p);
            model.addAttribute("cupSelected", category.equals("Cup"));
            model.addAttribute("strawSelected", category.equals("Straw"));
            model.addAttribute("toothbrushSelected", category.equals("Toothbrush"));
            model.addAttribute("edit", true);
            model.addAttribute("loggedinuser", getPrincipal());
            model.addAttribute("pagetitle", "Edit product");
        } catch (NumberFormatException e) {
            return "redirect:../../../products/";
        }
        return "view_create_edit_product";
    }

    @RequestMapping(value = {"/products/create"}, method = RequestMethod.GET)
    public String newProduct(ModelMap model) {
//        Hibernate.initialize(p.getOrderdetailsList());
        model.addAttribute("p", new Product());
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Add new product");
        return "view_create_edit_product";

    }

    @RequestMapping(value = {"/products/save"}, method = RequestMethod.POST)
    public String saveProduct(@Valid Product p, BindingResult result,
            ModelMap model) {

        if (result.hasErrors()) {
            //model.addAttribute("message", "There was an error trying to save. Please try again");
            return "redirect:/products/";
        }

        if ((p.getProductId() == 0) && (pdao.addProduct(p))) {
            // model.addAttribute("message", "Entry done");
        } else if (pdao.updateProduct(p)) {
            return "redirect:/products/" + p.getProductId();
        }

        //model.addAttribute("message", "There was a problem");
        return "redirect:/products/";
    }

    @RequestMapping(value = {"/products/delete/{id}"}, method = RequestMethod.GET)
    public String deleteProduct(ModelMap model, @PathVariable int id) {
        if (pdao.deleteProductById(id)) {
            model.addAttribute("message", "Product deleted successfully");
        } else {
            model.addAttribute("message", "Something went wrong. Could not delete");
        }
        //model.addAttribute("products", pdao.getAllProducts());
        return "redirect:/products/";
    }

    @RequestMapping(value = {"/customers"}, method = RequestMethod.GET)
    public String allCustomers(ModelMap model) {
        Product p = new Product();
//        Hibernate.initialize(p.getOrderdetailsList());
        List<Customer> customers = cdao.getAllCustomers();
        model.addAttribute("customers", customers);
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Customers list");
        return "customers";

    }

    @RequestMapping(value = {"/customers/update/{id}"}, method = RequestMethod.GET)
    public String editCustomer(ModelMap model, @PathVariable int id) {
        Customer c = cdao.getCustomerById(id);
        model.addAttribute("customer", c);
        model.addAttribute("action", "/BioEShop/admin/customers/save");
        model.addAttribute("cancel", "BioEShop/admin/customers");
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Edit Customer's Info");
        return "updateprofile";

    }

    @RequestMapping(value = {"/customers/save"}, method = RequestMethod.POST)
    public String saveCustomer(@Valid Customer customer, BindingResult result,
            ModelMap model, @RequestParam("oldemail") String oldemail) {

        if (result.hasErrors()) {
            model.addAttribute("loggedinuser", getPrincipal());
            model.addAttribute("pagetitle", "Edit Customer's Info");
            return "updateprofile";
        }

        if (!oldemail.equals(customer.getEmail())) {
            if (!customerService.isEmailUnique(customer.getCustomerId(), customer.getEmail())) {
                model.addAttribute("emailnotUnique", "Email " + customer.getEmail()
                        + " already exists. Please fill in a different email.");
                model.addAttribute("loggedinuser", getPrincipal());
                model.addAttribute("pagetitle", "Edit Customer's Info");
                return "updateprofile";
            }
        }

        if (customerService.updateCustomer(customer)) {
            model.addAttribute("message", "Info was updated successfully.");
        } else {
            model.addAttribute("success", "Info was not updated.");
        }
        List<Customer> customers = cdao.getAllCustomers();
        model.addAttribute("customers", customers);
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Customers list");
        return "customers";
    }

    @RequestMapping(value = {"/customers/delete/{id}"}, method = RequestMethod.GET)
    public String deleteCustomer(ModelMap model, @PathVariable int id) {
        boolean deleted = cdao.deleteCustomerById(id);
        if (deleted) {
            model.addAttribute("message", "Customer deleted successfully");
        } else {
            model.addAttribute("message", "Could not delete customer");
        }
        List<Customer> customers = cdao.getAllCustomers();
        model.addAttribute("customers", customers);
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Customers list");
        return "customers";

    }

    @RequestMapping(value = {"/orders/", "/orders/{something}"}, method = RequestMethod.GET)
    public String pendingOrders(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Orders list");
        return "view_orders";
    }

    @RequestMapping(value = {"/order/edit/{id}"}, method = RequestMethod.GET)
    public String editOrder(ModelMap model, @PathVariable int id) {
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("order", orderService.getOrderById(id));
        System.out.println("//////////////////////");
        System.out.println(orderService.getOrderById(id));
        model.addAttribute("action", "order/save");
        model.addAttribute("pagetitle", "Edit Order");
        return "view_edit_order";
    }

    @RequestMapping(value = {"/order/delete/{id}"}, method = RequestMethod.GET)
    public String deleteOrder(ModelMap model, @PathVariable int id) {
        if (orderService.deleteOrderById(id)) {
            return "redirect:/admin/orders/pending";
        }

        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Orders list");
        return "view_orders";
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
