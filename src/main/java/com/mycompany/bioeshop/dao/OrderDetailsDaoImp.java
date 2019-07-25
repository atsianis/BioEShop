/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.dao;

import com.mycompany.bioeshop.entities.Orderdetails;

/**
 *
 * @author samsung np350
 */
public class OrderDetailsDaoImp extends AbstractDao<Integer,Orderdetails> implements OrderDetailsDao{
    
    @Override
    public boolean updateOrderDetails(Orderdetails od){
        try {
            update(od);
            return true;
        } catch (Exception e) {
            return false;
        }
    } 
    
}
