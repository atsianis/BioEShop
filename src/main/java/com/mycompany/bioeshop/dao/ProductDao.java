/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.dao;

import com.mycompany.bioeshop.entities.Product;
import java.util.List;

/**
 *
 * @author samsung np350
 */
public interface ProductDao {
    
    public List<Product> getAllProducts();
    
    public List<Product> getProductByCategory(String category);
    
    public Product getProductById(int id);
    
    public boolean addProduct(Product product); 

    public boolean updateProduct(Product product); 
    
    
}
