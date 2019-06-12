package com.lxxt.po;

public class TaskAccept {

	
	Integer id;
	String acceptUser;
	String skill;
	String nickname;
	String wechat;
	Integer taskId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAcceptUser() {
		return acceptUser;
	}
	public void setAcceptUser(String acceptUser) {
		this.acceptUser = acceptUser;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getWechat() {
		return wechat;
	}
	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}
	
	
	@Override
	public String toString() {
		return "TaskAccept [id=" + id + ", acceptUser=" + acceptUser + ", skill=" + skill + ", nickname=" + nickname
				+ ", wechat=" + wechat + ", taskId=" + taskId + "]";
	}
	

}
