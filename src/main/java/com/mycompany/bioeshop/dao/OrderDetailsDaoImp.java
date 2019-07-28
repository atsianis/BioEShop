/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.dao;

import com.mycompany.bioeshop.entities.OrderDetails;

/**
 *
 * @author samsung np350
 */
public class OrderDetailsDaoImp extends AbstractDao<Integer,OrderDetails> implements OrderDetailsDao{
    
    @Override
    public boolean updateOrderDetails(OrderDetails od){
        try {
            update(od);
            return true;
        } catch (Exception e) {
            return false;
        }
    } 
    
}
