/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.controllers;

import com.mycompany.bioeshop.entities.Message;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author samsung np350
 */
@Controller
@RequestMapping("/chat")
public class ChatController {
    
    @RequestMapping(value="",method=RequestMethod.GET)
    public String chatPage(ModelMap model){
        model.addAttribute("name",getPrincipal());
        model.addAttribute("message", new Message());
        model.addAttribute("loggedinuser",getPrincipal());
        model.addAttribute("pagetitle", "Chat");
        return "chat";
    }
    
    @RequestMapping(value="/addMessage",method=RequestMethod.POST)
    public String addMessage(ModelMap model,@ModelAttribute Message message){
        Message.addMessage(message);
        return "redirect:/chat";
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
