package com.lxxt.po;

public class Live {

	Integer id;
	String name;
	String link;
	String uploader;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getUploader() {
		return uploader;
	}
	public void setUploader(String uploader) {
		this.uploader = uploader;
	}
	
	@Override
	public String toString() {
		return "Live [id=" + id + ", name=" + name + ", link=" + link + ", uploader=" + uploader + "]";
	}
}
