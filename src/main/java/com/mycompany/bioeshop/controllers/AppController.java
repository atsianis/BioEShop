package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.dao.ProductDao;
import com.mycompany.bioeshop.entities.Customer;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mycompany.bioeshop.entities.User;
import com.mycompany.bioeshop.entities.UserProfile;
import com.mycompany.bioeshop.service.CustomerService;
import com.mycompany.bioeshop.service.UserProfileService;
import com.mycompany.bioeshop.service.UserService;
import java.util.ArrayList;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class AppController {

    @Autowired
    UserService userService;

    @Autowired
    CustomerService customerService;

    @Autowired
    UserProfileService userProfileService;

    @Autowired
    MessageSource messageSource;
    
    @Autowired
    ProductDao pdao;

    @Autowired
    PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

    @Autowired
    AuthenticationTrustResolver authenticationTrustResolver;

    /**
     * This method will list all existing users.
     */
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
//		List<User> users = userService.findAllUsers();
//		model.addAttribute("users", users);
//        return "userslist";
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("pagetitle", "Home page");
        return "home";
    }

    /**
     * This method will provide the medium to add a new user.
     */
    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User user = new User();
        Customer customer = new Customer();
        List<UserProfile> userProfileList = new ArrayList();
        user.setCustomer(customer);
        user.setUserProfileList(userProfileList);
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        model.addAttribute("action", "newuser");
        return "registration";
    }

    /**
     * This method will be called on form submission, handling POST request for
     * saving user in database. It also validates the user input
     */
    @RequestMapping(value = {"/newuser"}, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result,
            ModelMap model) {

        if (result.hasErrors()) {
            return "registration";
        }

        boolean notUnique = false;
        if (!userService.isUserSSOUnique(user.getId(), user.getSsoId())) {
            model.addAttribute("ssoIdNotUnique", "Username " + user.getSsoId()
                    + " already exists. Please fill in a different username.");
            notUnique = true;
        }

        if (!customerService.isEmailUnique(user.getCustomer().getCustomerId(), user.getCustomer().getEmail())) {
            model.addAttribute("emailnotUnique", "Email " + user.getCustomer().getEmail()
                    + " already exists. Please fill in a different email.");
            notUnique = true;
        }

        if (notUnique) {
            model.addAttribute("action", "newuser");
            return "registration";
        }

        UserProfile userProfile = new UserProfile(new Long(1), "USER");
        List<UserProfile> userProfileList = new ArrayList();
        userProfileList.add(userProfile);
        user.setUserProfileList(userProfileList);
        userService.saveUser(user);

        model.addAttribute("success", "Dear " + user.getSsoId() + ", you have registered successfully.");
        model.addAttribute("path", "4; URL=/BioEShop/");
        return "registrationsuccess";
    }
    
    
    
    
    @RequestMapping(value = {"/products"}, method = RequestMethod.GET)
    public String allProducts(ModelMap model){
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("products", pdao.getAllProducts());
        return "products";
        
    }
//
//
//	/**
//	 * This method will provide the medium to update an existing user.
//	 */
//	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
//	public String editUser(@PathVariable String ssoId, ModelMap model) {
//		User user = userService.findBySSO(ssoId);
//		model.addAttribute("user", user);
//		model.addAttribute("edit", true);
//		model.addAttribute("loggedinuser", getPrincipal());
//		return "registration";
//	}
//	
//	/**
//	 * This method will be called on form submission, handling POST request for
//	 * updating user in database. It also validates the user input
//	 */
//	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
//	public String updateUser(@Valid User user, BindingResult result,
//			ModelMap model, @PathVariable String ssoId) {
//
//		if (result.hasErrors()) {
//			return "registration";
//		}
//
//		/*//Uncomment below 'if block' if you WANT TO ALLOW UPDATING SSO_ID in UI which is a unique key to a User.
//		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
//			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
//		    result.addError(ssoError);
//			return "registration";
//		}*/
//
//
//		userService.updateUser(user);
//
////		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
//		model.addAttribute("loggedinuser", getPrincipal());
//		return "registrationsuccess";
//	}
//
//	
//	/**
//	 * This method will delete an user by it's SSOID value.
//	 */
//	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
//	public String deleteUser(@PathVariable String ssoId) {
//		userService.deleteUserBySSO(ssoId);
//		return "redirect:/list";
//	}
//	
//

    /**
     * This method will provide UserProfile list to views
     */
    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }

    /**
     * This method handles Access-Denied redirect.
     */
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        return "accessDenied";
    }

    /**
     * This method handles login GET requests. If users is already logged-in and
     * tries to goto login page again, will be redirected to list page.
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(ModelMap model) {
        if (isCurrentAuthenticationAnonymous()) {
            model.addAttribute("pagetitle", "Login");
            return "login";
        } else {
            return "redirect:/home";
        }
    }

    /**
     * This method handles logout requests. Toggle the handlers if you are
     * RememberMe functionality is useless in your app.
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            //new SecurityContextLogoutHandler().logout(request, response, auth);
            persistentTokenBasedRememberMeServices.logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/login?logout";
    }

    /**
     * This method returns the principal[user-name] of logged-in user.
     */
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

    /**
     * This method returns true if users is already authenticated [logged-in],
     * else false.
     */
    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }

}
