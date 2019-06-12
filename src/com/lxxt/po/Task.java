package com.lxxt.po;

public class Task {

	Integer id;
	String title;
	String publisher;
	String descr;
	String begintime;
	String endtime;
	Integer accept;//接受人数
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getAccept() {
		return accept;
	}
	public void setAccept(Integer accept) {
		this.accept = accept;
	}
	@Override
	public String toString() {
		return "Task [id=" + id + ", publisher=" + publisher + ", descr=" + descr + ", beginTime=" + begintime
				+ ", endTime=" + endtime + ", accept=" + accept + "]";
	}
	
}
