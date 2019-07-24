/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bioeshop.entities;

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
import javax.persistence.UniqueConstraint;
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
@Table(name = "customers", catalog = "zzz", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"email"})
    , @UniqueConstraint(columnNames = {"phone_number"})})
//@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c")
    , @NamedQuery(name = "Customer.findByCustomerId", query = "SELECT c FROM Customer c WHERE c.customerId = :customerId")
    , @NamedQuery(name = "Customer.findByFname", query = "SELECT c FROM Customer c WHERE c.fname = :fname")
    , @NamedQuery(name = "Customer.findByLname", query = "SELECT c FROM Customer c WHERE c.lname = :lname")
    , @NamedQuery(name = "Customer.findByEmail", query = "SELECT c FROM Customer c WHERE c.email = :email")
    , @NamedQuery(name = "Customer.findByAddress", query = "SELECT c FROM Customer c WHERE c.address = :address")
    , @NamedQuery(name = "Customer.findByPhoneNumber", query = "SELECT c FROM Customer c WHERE c.phoneNumber = :phoneNumber")})
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "customer_id", nullable = false)
    private Integer customerId;
    @Size(max = 45)
    @Column(length = 45)
    private String fname;
    @Size(max = 45)
    @Column(length = 45)
    private String lname;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(nullable = false, length = 45)
    private String email;
    @Size(max = 60)
    @Column(length = 60)
    private String address;
    @Size(max = 45)
    @Column(name = "phone_number", length = 45)
    private String phoneNumber;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customer", fetch = FetchType.LAZY)
    private List<Order$> orderList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customer", fetch = FetchType.LAZY)
    private List<User> userList;

    public Customer() {
    }

    public Customer(Integer customerId) {
        this.customerId = customerId;
    }

    public Customer(Integer customerId, String email) {
        this.customerId = customerId;
        this.email = email;
    }

    public Customer(String fname, String lname, String email) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
    }
    
    

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @XmlTransient
    public List<Order$> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Order$> orderList) {
        this.orderList = orderList;
    }

    @XmlTransient
    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customerId != null ? customerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customer)) {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.customerId == null && other.customerId != null) || (this.customerId != null && !this.customerId.equals(other.customerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerId=" + customerId + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", address=" + address + ", phoneNumber=" + phoneNumber +'}';
    }

    
    
}
