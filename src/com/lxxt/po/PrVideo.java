package com.lxxt.po;

public class PrVideo {

	private Integer id;
	private String prvideo_name;
	private String prvideo_introduce;
	private String prvideo_route;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPrvideo_name() {
		return prvideo_name;
	}
	public void setPrvideo_name(String prvideo_name) {
		this.prvideo_name = prvideo_name;
	}
	public String getPrvideo_introduce() {
		return prvideo_introduce;
	}
	public void setPrvideo_introduce(String prvideo_introduce) {
		this.prvideo_introduce = prvideo_introduce;
	}
	public String getPrvideo_route() {
		return prvideo_route;
	}
	public void setPrvideo_route(String prvideo_route) {
		this.prvideo_route = prvideo_route;
	}
	@Override
	public String toString() {
		return "PrVideo [id=" + id + ", prvideo_name=" + prvideo_name + ", prvideo_introduce=" + prvideo_introduce
				+ ", prvideo_route=" + prvideo_route + "]";
	}
	
}
