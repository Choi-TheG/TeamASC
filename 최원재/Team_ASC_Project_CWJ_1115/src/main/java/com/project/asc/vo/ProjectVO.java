package com.project.asc.vo;

public class ProjectVO {

	private int projectSeq;
	private String teamId;
	private String projectName;
	private String finishYn;
	private double percentage;
	private String createDate;
	private int teamLeaderSeq;
	private String teamCategory;
	
	public ProjectVO() {}
	
	public ProjectVO(int projectSeq,String teamId,String projectName,String finishYn
			,double percentage,String createDate,int teamLeaderSeq,String teamCategory) {
		this.projectSeq = projectSeq;
		this.teamId = teamId;
		this.projectName = projectName;
		this.finishYn = finishYn;
		this.percentage = percentage;
		this.createDate = createDate;
		this.teamLeaderSeq = teamLeaderSeq;
		this.teamCategory = teamCategory;
	}
	
	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getFinishYn() {
		return finishYn;
	}

	public void setFinishYn(String finishYn) {
		this.finishYn = finishYn;
	}

	public double getPercentage() {
		return percentage;
	}

	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getTeamLeaderSeq() {
		return teamLeaderSeq;
	}

	public void setTeamLeaderSeq(int teamLeaderSeq) {
		this.teamLeaderSeq = teamLeaderSeq;
	}
	
	public String getTeamCategory() {
		return teamCategory;
	}

	public void setTeamCategory(String teamCategory) {
		this.teamCategory = teamCategory;
	}

	@Override
	public String toString() {
		return "projectSeq : " + this.projectSeq +
				"teamId : " + this.teamId +
				"projectName : " + this.projectName + 
				"finishYn : " + this.finishYn + 
				"percentage : " + this.percentage + 
				"createDate : " + this.createDate;
	}
}
