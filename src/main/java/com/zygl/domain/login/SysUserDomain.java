package com.zygl.domain.login;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "sys_user")
public class SysUserDomain implements Serializable {

    private static final long serialVersionUID = 7419229779731522702L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 50, unique = true)
    private String account;

    /**springmvc生成json不包含此字段*/
    /**
     * 密码
     */
    @Column(length = 100)
    @JsonIgnore
    private String password;
    /**
     * 科室电话
     */
    @Column(length = 20)
    private String mobilePhone;
    /**
     * 手机
     */
    @Column(length = 20)
    private String telephone;
    /**
     * 邮件
     */
    @Column(length = 50)
    private String email;
    /**
     * 国家
     */
    @Column(length = 10)
    private Integer country;
    /**
     * 省
     */
    @Column(length = 10)
    private Integer province;
    /**
     * 市
     */
    @Column(length = 10)
    private Integer city;
    /**
     * 籍贯
     */
    @Column(length = 300)
    private String nativePlace;
    /**
     * 当前住址
     */
    @Column(length = 300)
    private String presentAddress;
    /**
     * 邮政编码
     */
    @Column(length = 50)
    private String postalcode;
    /**
     * 紧急联系人
     */
    @Column(length = 50)
    private String emergencyContact;
    /**
     * 紧急联系人电话
     */
    @Column(length = 20)
    private String emergencyPhone;
    /**
     * 真实姓名
     */
    @Column(length = 50)
    private String realName;
    /**
     * 所在部门
     */
    @Column(length = 10)
    private Integer organizationId;


	/*
	 * @ManyToMany(cascade = { CascadeType.PERSIST })
	 * 
	 * @JsonIgnore
	 * 
	 * @JoinTable(name = "CMSUserRole", joinColumns = { @JoinColumn(name = "id",
	 * referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name =
	 * "roleid", referencedColumnName = "roleid") }) private Collection<Role>
	 * roles;
	 */

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getCountry() {
        return country;
    }

    public void setCountry(Integer country) {
        this.country = country;
    }

    public Integer getProvince() {
        return province;
    }

    public void setProvince(Integer province) {
        this.province = province;
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getPresentAddress() {
        return presentAddress;
    }

    public void setPresentAddress(String presentAddress) {
        this.presentAddress = presentAddress;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public String getEmergencyContact() {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        this.emergencyContact = emergencyContact;
    }

    public String getEmergencyPhone() {
        return emergencyPhone;
    }

    public void setEmergencyPhone(String emergencyPhone) {
        this.emergencyPhone = emergencyPhone;
    }

    /**
     * 本函数输出将作为默认的<shiro:principal/>输出.
     */
    public String toString() {
        return account;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }
}
