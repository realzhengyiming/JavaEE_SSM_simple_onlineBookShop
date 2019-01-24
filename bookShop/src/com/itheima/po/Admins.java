package com.itheima.po;

/*后台管理员*/
public class Admins {
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String adminName;
	private String password;
	@Override
	public String toString() {
		return "Admins [id=" + id + ", adminName=" + adminName + ", password=" + password + ", getId()=" + getId()
				+ ", getAdminName()=" + getAdminName() + ", getPassword()=" + getPassword() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
