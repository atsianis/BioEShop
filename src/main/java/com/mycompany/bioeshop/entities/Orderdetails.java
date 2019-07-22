/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author samsung np350
 */
@Entity
@Transactional
@Table(catalog = "zzz", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"order_id", "product_id"})})
//@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderdetails.findAll", query = "SELECT o FROM Orderdetails o")
    , @NamedQuery(name = "Orderdetails.findByOdId", query = "SELECT o FROM Orderdetails o WHERE o.odId = :odId")
    , @NamedQuery(name = "Orderdetails.findByQuantity", query = "SELECT o FROM Orderdetails o WHERE o.quantity = :quantity")})
public class Orderdetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "od_id", nullable = false)
    private Integer odId;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int quantity;
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Order$ order;
    @JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Product product;

    public Orderdetails() {
    }

    public Orderdetails(Integer odId) {
        this.odId = odId;
    }

    public Orderdetails(Integer odId, int quantity) {
        this.odId = odId;
        this.quantity = quantity;
    }

    public Integer getOdId() {
        return odId;
    }

    public void setOdId(Integer odId) {
        this.odId = odId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Order$ getOrderId() {
        return order;
    }

    public void setOrderId(Order$ order) {
        this.order = order;
    }

    public Product getProductId() {
        return product;
    }

    public void setProductId(Product product) {
        this.product = product;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (odId != null ? odId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderdetails)) {
            return false;
        }
        Orderdetails other = (Orderdetails) object;
        if ((this.odId == null && other.odId != null) || (this.odId != null && !this.odId.equals(other.odId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Orderdetails{" + "odId=" + odId + ", quantity=" + quantity + ", orderId=" + order + ", productId=" + product + '}';
    }

    
    
}
