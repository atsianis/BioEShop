/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author samsung np350
 */
@Entity
@Table(name = "orders", catalog = "zzz", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderxxx.findAll", query = "SELECT o FROM Orderxxx o")
    , @NamedQuery(name = "Orderxxx.findByOrderId", query = "SELECT o FROM Orderxxx o WHERE o.orderId = :orderId")
    , @NamedQuery(name = "Orderxxx.findByDate", query = "SELECT o FROM Orderxxx o WHERE o.date = :date")
    , @NamedQuery(name = "Orderxxx.findByStatus", query = "SELECT o FROM Orderxxx o WHERE o.status = :status")
    , @NamedQuery(name = "Orderxxx.findByComments", query = "SELECT o FROM Orderxxx o WHERE o.comments = :comments")})
public class Orderxxx implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "order_id", nullable = false)
    private Integer orderId;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(nullable = false, length = 45)
    private String status;
    @Size(max = 200)
    @Column(length = 200)
    private String comments;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderId", fetch = FetchType.LAZY)
    private Collection<Orderdetails> orderdetailsCollection;
    @JoinColumn(name = "customer_id", referencedColumnName = "customer_id", nullable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Customer customerId;

    public Orderxxx() {
    }

    public Orderxxx(Integer orderId) {
        this.orderId = orderId;
    }

    public Orderxxx(Integer orderId, Date date, String status) {
        this.orderId = orderId;
        this.date = date;
        this.status = status;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @XmlTransient
    public Collection<Orderdetails> getOrderdetailsCollection() {
        return orderdetailsCollection;
    }

    public void setOrderdetailsCollection(Collection<Orderdetails> orderdetailsCollection) {
        this.orderdetailsCollection = orderdetailsCollection;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderxxx)) {
            return false;
        }
        Orderxxx other = (Orderxxx) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.bioeshop.entities.Orderxxx[ orderId=" + orderId + " ]";
    }
    
}
