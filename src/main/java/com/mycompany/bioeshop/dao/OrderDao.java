/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.dao;
import com.mycompany.bioeshop.entities.Customer;
import com.mycompany.bioeshop.entities.Order$;
import com.mycompany.bioeshop.entities.OrderDetails;
import java.util.List;

/**
 *
 * @author samsung np350
 */
public interface OrderDao {
    
    public boolean createOrder(Order$ o);
    
    public List<Order$> getOrdersForCustomerById(int id);
    
    public List<Order$> getPendingOrders();
    
    public List<Order$> getDoneOrders();
    
    public Order$ getOrderById(int id); 
    
    public boolean deleteOrderById(int id);
    
    public boolean updateOrder(Order$ o);
    
    
    
    
}
