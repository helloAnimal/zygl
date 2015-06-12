package com.zygl.domain.login;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CMSRole")
public class Role implements Serializable {
    private static final long serialVersionUID = 6177417450707400228L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "roleid")
    private Long id;
    @Column(length = 50)
    private String name;
    @Column(length = 50)
    private String description;

    @Column(length = 50)
    private String realName;
    
    
    
    /*@ManyToMany(mappedBy = "roles")
    @Basic(fetch = FetchType.LAZY)
    private Collection<UserModel> users;*/

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE}, fetch = FetchType.LAZY)
    @JoinTable(name = "CMSRolePms",
            joinColumns = {@JoinColumn(name = "roleid", updatable = false)},
            inverseJoinColumns = {@JoinColumn(name = "pmsid", updatable = false)})
    private Collection<Permission> pmss;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /*    public Collection<UserModel> getUsers() {
            return users;
        }
        public void setUsers(Collection<UserModel> users) {
            this.users = users;
        }*/
    public Collection<Permission> getPmss() {
        return pmss;
    }

    public void setPmss(Collection<Permission> pmss) {
        this.pmss = pmss;
    }

}
