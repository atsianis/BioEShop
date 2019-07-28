/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author samsung np350
 */
@Entity
@Transactional
@Table(name = "products", catalog = "zzz", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findByProductId", query = "SELECT p FROM Product p WHERE p.productId = :productId")
    , @NamedQuery(name = "Product.findByPath", query = "SELECT p FROM Product p WHERE p.path = :path")
    , @NamedQuery(name = "Product.findByDescr", query = "SELECT p FROM Product p WHERE p.descr = :descr")
    , @NamedQuery(name = "Product.findByStock", query = "SELECT p FROM Product p WHERE p.stock = :stock")
    , @NamedQuery(name = "Product.findByTitle", query = "SELECT p FROM Product p WHERE p.title = :title")
    , @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price")
    , @NamedQuery(name = "Product.findByCategory", query = "SELECT p FROM Product p WHERE p.category = :category")
    , @NamedQuery(name = "Product.findByColor", query = "SELECT p FROM Product p WHERE p.color = :color")
    , @NamedQuery(name = "Product.findBySize", query = "SELECT p FROM Product p WHERE p.size = :size")
    , @NamedQuery(name = "Product.findByMaterial", query = "SELECT p FROM Product p WHERE p.material = :material")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "product_id", nullable = false)
    private Integer productId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(nullable = false, length = 100)
    private String path;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(nullable = false, length = 200)
    private String descr;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int stock;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(nullable = false, length = 45)
    private String title;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private double price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(nullable = false, length = 45)
    private String category;
    @Size(max = 45)
    @Column(length = 45)
    private String color;
    @Size(max = 45)
    @Column(length = 45)
    private String size;
    @Size(max = 45)
    @Column(length = 45)
    private String material;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.LAZY)
    private List<Orderdetails> orderdetailsList;

    public Product() {
    }

    public Product(Integer productId) {
        this.productId = productId;
    }

    public Product(Integer productId, String path, String descr, int stock, String title, double price, String category) {
        this.productId = productId;
        this.path = path;
        this.descr = descr;
        this.stock = stock;
        this.title = title;
        this.price = price;
        this.category = category;
    }

    public Product(Integer productId, String path, String descr, int stock, String title, double price, String category, String color, String size, String material) {
        this.productId = productId;
        this.path = path;
        this.descr = descr;
        this.stock = stock;
        this.title = title;
        this.price = price;
        this.category = category;
        this.color = color;
        this.size = size;
        this.material = material;
    }
    
    
    // these are the minimum fields we need to create a nwe product, (according to the not null fields)
    // this should be the constructor when creating a product, I guess
    public Product(String path, String descr, int stock, String title, double price, String category) {
        this.path = path;
        this.descr = descr;
        this.stock = stock;
        this.title = title;
        this.price = price;
        this.category = category;
    }

    public Product(String path, String descr, int stock, String title, double price, String category, List<Orderdetails> orderdetailsList) {
        this.path = path;
        this.descr = descr;
        this.stock = stock;
        this.title = title;
        this.price = price;
        this.category = category;
        this.orderdetailsList = orderdetailsList;
    }
    
    

    public Product(String path, String descr, int stock, String title, double price, String category, String color, String size, String material) {
        this.path = path;
        this.descr = descr;
        this.stock = stock;
        this.title = title;
        this.price = price;
        this.category = category;
        this.color = color;
        this.size = size;
        this.material = material;
    }

    
    
    

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    //@XmlTransient
    public List<Orderdetails> getOrderdetailsList() {
        return orderdetailsList;
    }

    public void setOrderdetailsList(List<Orderdetails> orderdetailsList) {
        this.orderdetailsList = orderdetailsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", path=" + path + ", descr=" + descr + ", stock=" + stock + ", title=" + title + ", price=" + price + ", category=" + category + ", color=" + color + ", size=" + size + ", material=" + material +'}';
    }

    
    
}
