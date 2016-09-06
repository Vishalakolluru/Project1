package com.niit.cartbackend.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
@Entity
@Table
public class Register {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
		private int id;
	@NotNull
	@Size(min=2,max=30,message="Name must be more than 2 letters")
	@Column(name="username")
		private String username;
	@NotNull
	@Size(min=2,max=30)
	@Column(name="password")
		private String password;
	@NotNull
	@Size(min=2,max=30,message="mobile number must be 10 numbers")
	@Column(name="mobilenumber")
	private String mobilenumber;
	@NotNull
	@Size(min=2,max=30,message="mail must be @")
	@Column(name="mail")
		private String mail;
	@NotNull
	@Size(min=2,max=30)
	@Column(name="address")
		private String address;
	@NotNull
	 @Size(min=2,max=30)
	 @Column(name="confirmpassword")
    private String confirmpassword; 
	 @NotNull
		@Column(name="status")
		private boolean status=true;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public String getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public boolean getStatus() {
		return status;
	}
}
