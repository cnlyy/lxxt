package com.lxxt.po;

public class PsVideo {

	private Integer id;
	private String psvideo_name;
	private String psvideo_introduce;
	private String psvideo_route;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPsvideo_name() {
		return psvideo_name;
	}
	public void setPsvideo_name(String psvideo_name) {
		this.psvideo_name = psvideo_name;
	}
	public String getPsvideo_introduce() {
		return psvideo_introduce;
	}
	public void setPsvideo_introduce(String psvideo_introduce) {
		this.psvideo_introduce = psvideo_introduce;
	}
	public String getPsvideo_route() {
		return psvideo_route;
	}
	public void setPsvideo_route(String psvideo_route) {
		this.psvideo_route = psvideo_route;
	}
	@Override
	public String toString() {
		return "PsVideo [id=" + id + ", psvideo_name=" + psvideo_name + ", psvideo_introduce=" + psvideo_introduce
				+ ", psvideo_route=" + psvideo_route + "]";
	}
	
}
